require "kemal"

module Dravite::Server
  extend self

  def init
    Kemal.run
  end
end
