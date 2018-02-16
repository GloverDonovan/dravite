require "markd"
require "crinja"
require "sass"
require "kemal"
require "colorize"
require "option_parser"
require "./modules/*"
require "./cli"

module Dravite
  extend self

  VERSION = "0.1.0"

  MARKD = Markd::Options.new(smart: true)

  def parse(dir : String)
    js_dir       = "#{dir}/#{Dravite::IN[:js]}"
    css_dir      = "#{dir}/#{Dravite::IN[:css]}"
    pages_dir    = "#{dir}/#{Dravite::IN[:pages]}"
    posts_dir    = "#{dir}/#{Dravite::IN[:posts]}"
    layouts_dir  = "#{dir}/#{Dravite::IN[:layouts]}"
    includes_dir = "#{dir}/#{Dravite::IN[:includes]}"
    data_dir     = "#{dir}/#{Dravite::IN[:data]}"

    Dravite.parse_pages(pages_dir, layouts_dir)
  end

  def parse_pages(pages_dir : String, layouts_dir : String)
    Dir.each_child(pages_dir) do |page|
      output = if page.ends_with?("md")
                 Dravite::Parse.markdown("#{pages_dir}/#{page}")
               else
                 File.read("#{pages_dir}/#{page}")
               end
      render = Dravite::Parse.crinja("#{layouts_dir}/default.html", {
        "content" => output,
        "page" => {} of String => String,
        "site" => {} of String => String,
        "header" => "includes/header.html",
        "footer" => "includes/footer.html"
      })
      puts render
    end
  end

  def err(str : String)
    puts str.colorize(:red)
    exit 1
  end
end
