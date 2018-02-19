# Dravite is a static site generator. The `Site` class
# handles creating individual "site" instances and keeping
# track of all their configuration variables
module Dravite
  class Site
    def initialize
      @root_dir = "."
    end
  end
end
