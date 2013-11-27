require 'rails/generators/base'

module Revisioneer
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Generats Revisioneer views."

      class_option :haml, desc: "use haml?", type: :boolean, default: true

      def generate_views
        if options.haml?
          copy_file "index.haml", "app/views/revisioneer_rails/revisions/index.haml"
        else
          copy_file "index.html.erb", "app/views/revisioneer_rails/revisions/index.html.erb"
        end
      end
    end
  end
end
