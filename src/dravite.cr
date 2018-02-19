require "markd"
require "crinja"
require "sass"
require "kemal"
require "colorize"
require "option_parser"
require "./dravite/modules/*"
require "./dravite/classes/*"
require "./cli"

module Dravite
  extend self

  VERSION = "0.1.0"

  MARKD = Markd::Options.new(smart: true)

  # NOTE: Generation functionality can probably be separated into
  # its own module; this makes it easier to use Dravite as a library
  # in addition to an application
  def parse_pages
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
