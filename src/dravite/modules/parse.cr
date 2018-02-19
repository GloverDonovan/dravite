module Dravite::Parse
  extend self

  def markdown(file : String) : String
    Markd.to_html(File.read(file), Dravite::MARKD)
  end

  def crinja(file : String, data : Hash = {} of String => String) : String
    crinja = Crinja.new
    crinja.loader = Crinja::Loader::FileSystemLoader.new([".", "./includes"])
    crinja.get_template(file).render(data)
    #Crinja::Template.new(File.read(file)).render(data)
  end

  def sass(file : String) : String
    Sass.compile_file(file)
  end
end
