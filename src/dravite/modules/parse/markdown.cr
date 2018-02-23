require "markd"

module Dravite::Parse
  MARKD = Markd::Options.new(smart: true)

  def markdown(file : String) : String
    Markd.to_html File.read(file), Dravite::Parse::MARKD
  end
end
