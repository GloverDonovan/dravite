require "./dravite"

OptionParser.parse! do |opts|
  opts.banner = "Usage: drav [directory]"

  opts.on("-h", "--help", "Show this help message") do
    puts opts
  end

  opts.on("-v", "--version", "Show version information") do
    puts Dravite::VERSION
  end

  opts.on("-s", "--server", "Start a local server") do
    Dravite::Server.init
  end

  opts.unknown_args do |args|
    if args.size > 0
      Dravite::Build.init(args[0])
    else
      Dravite::Build.init(".")
    end
  end
end
