require "markd"
require "crinja"
require "sass"
require "colorize"

module Dravite
  extend self
  MARKD = Markd::Options.new(smart: true)

  def cli
    if ARGV.size > 0
      Dravite.parse(ARGV[0])
    end
  end

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
    self.err "Directory does not exist." unless Dir.exists?(dir)

    style_dir = "#{dir}/_sass"
    pages_dir = "#{dir}/_pages"
    layouts_dir = "#{dir}/_layouts"
    out_dir = "#{dir}/.site"

    self.err "Style dir does not exist." unless Dir.exists?(style_dir)
    self.err "Pages dir does not exist." unless Dir.exists?(pages_dir)
    self.err "Layouts dir does not exist." unless Dir.exists?(layouts_dir)
    Dir.mkdir(out_dir) unless Dir.exists?(out_dir)

    Dir.each_child(pages_dir) do |page|
      self.err "Page must be markdown." unless page.ends_with?(".md")

      output = Dravite::Parse.markdown("#{pages_dir}/#{page}")
      render = Dravite::Parse.crinja("#{layouts_dir}/default.html", {
        "content" => output,
      })
      File.write("#{out_dir}/#{page.chomp(".md")}.html", render)
    end

    File.write("#{out_dir}/design.css", Dravite::Parse.sass("#{style_dir}/main.sass"))
  end

  def err(str : String)
    puts str.colorize(:red)
    exit 1
  end
end

Dravite.cli
