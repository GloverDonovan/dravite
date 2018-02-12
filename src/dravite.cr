require "markd"
require "crinja"
require "sass"
require "colorize"
require "option_parser"

module Dravite
  extend self

  VERSION = "0.1.0"

  MARKD = Markd::Options.new(smart: true)

  IN = {
    :js       => "app",
    :css      => "style",
    :pages    => "pages",
    :posts    => "posts",
    :layouts  => "layouts",
    :includes => "includes",
    :data     => "data",
  }

  OUT = {
    :js  => "app.js",
    :css => "design.css",
  }

  module Parse
    extend self

    def markdown(file : String) : String
      Markd.to_html(File.read(file), Dravite::MARKD)
    end

    def crinja(file : String, data : Hash = {} of String => String) : String
      Crinja::Template.new(File.read(file)).render(data)
    end

    def sass(file : String) : String
      Sass.compile_file(file)
    end
  end

  def parse(dir : String)
    js_dir       = "#{dir}/#{Dravite::IN[:js]}"
    css_dir      = "#{dir}/#{Dravite::IN[:css]}"
    pages_dir    = "#{dir}/#{Dravite::IN[:pages]}"
    posts_dir    = "#{dir}/#{Dravite::IN[:posts]}"
    layouts_dir  = "#{dir}/#{Dravite::IN[:layouts]}"
    includes_dir = "#{dir}/#{Dravite::IN[:includes]}"
    data_dir     = "#{dir}/#{Dravite::IN[:data]}"

    puts Dravite.parse_pages(pages_dir, layouts_dir)
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
      })
    end
  end

  def err(str : String)
    puts str.colorize(:red)
    exit 1
  end
end

OptionParser.parse! do |opts|
  opts.banner = "Usage: drav [directory]"

  opts.on("-h", "--help", "Show this help message") do
    puts opts
  end

  opts.on("-v", "--version", "Show version information") do
    puts Dravite::VERSION
  end

  opts.unknown_args do |args|
    if args.size > 0
      Dravite.parse(args[0])
    else
      Dravite.parse(".")
    end
  end
end
