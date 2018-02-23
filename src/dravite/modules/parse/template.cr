require "crinja"

crinja = Crinja.new

module Dravite::Parse
  # TODO: Use named parameters to pass optional information such as additional
  # data fields and content (file vs string, etc.), as well as Dravite::Site
  def crinja(file : String) : String
    crinja.loader = Crinja::Loader::FileSystemLoader.new(["#{root_dir}", "#{root_dir}/#{s.includes_dir}"])

    crinja.get_template(file).render("#{s.layouts_dir}/#{s.default_layout}", {
      "content" => output,
      "page" => {} of String => String,
      "site" => {} of String => String,
      "header" => "#{s.includes_dir}/#{s.template_header}",
      "footer" => "#{s.includes_dir}/#{s.template_footer}"
    })
  end
end
