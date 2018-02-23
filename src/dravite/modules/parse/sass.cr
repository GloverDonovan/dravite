require "sass"

module Dravite::Parse
  def sass(file : String) : String
    Sass.compile_file(file)
  end
end
