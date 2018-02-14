module Dravite::Server
  extend self

  def init
    Dravite::Build.init(Dravite::Config.get_str(:dir))
    Kemal.run
  end
end

