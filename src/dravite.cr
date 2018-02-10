require "markd"
require "crinja"
require "sass"
require "colorize"
require "option_parser"

module Dravite
  extend self

  VERSION = "0.1.0"

  MARKD = Mard::Options.new(smart: true)

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
      puts "The drav [directory] functionality is incomplete for now."
    end
  end
end
