# Dravite is a static site generator. The `Site` class
# handles creating individual "site" instances and keeping
# track of all their config values
module Dravite
  class Site
    def initialize
      @root_dir     = "."

      @pages_dir    = "pages"
      @posts_dir    = "posts"
      @layouts_dir  = "layouts"
      @data_dir     = "data"
      @includes_dir = "includes"

      @sass_dir     = "sass"
      @js_dir       = "app"

      @default_layout   = "default.html"
      @template_header  = "header.html"
      @template_footer  = "footer.html"
    end
  end
end
