require "./dravite/classes/site"
require "./dravite/modules/parse"
{% unless flag?(:no_markdown) %}  require "./dravite/modules/parse/markdown"  {% end %}
{% unless flag?(:no_sass) %}      require "./dravite/modules/parse/sass"      {% end %}
{% unless flag?(:no_template) %}  require "./dravite/modules/parse/template"  {% end %}
{% unless flag?(:no_server) %}    require "./dravite/modules/server"          {% end %}
{% unless flag?(:no_build) %}     require "./dravite/modules/build"           {% end %}

module Dravite
  extend self

  VERSION = "0.1.0"
end
