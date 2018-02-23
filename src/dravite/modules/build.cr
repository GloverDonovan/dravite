module Dravite::Build
  extend self

  def init(site : String)
    {% unless flag?(:no_markdown) %}
      # TODO: Handle markdown files
    {% end %}

    {% unless flag?(:no_sass) %}
      # TODO: Handle Sass files
    {% end %}

    {% unless flag?(:no_template) %}
      # TODO: Handle template files
    {% end %}
  end
end
