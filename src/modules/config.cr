module Dravite::Config
  extend self

  @@STRING : Hash(Symbol, String) = {
    :dir      => ".",
    :js       => "app",
    :css      => "style",
    :pages    => "pages",
    :posts    => "posts",
    :layouts  => "layouts",
    :includes => "includes",
    :data     => "data",
    :js_out   => "app.js",
    :css_out  => "design.css",
  }

  def get_str(key : Symbol) : String
    if @@STRING.has_key?(key)
      @@STRING[key]
    else
      raise "#{key} is not a valid key."
    end
  end

  def set_str(key : Symbol, value : String)
    if @@STRING.has_key?(key)
      @@STRING[key] = value
    else
      raise "#{key} is not a valid key."
    end
  end
end
