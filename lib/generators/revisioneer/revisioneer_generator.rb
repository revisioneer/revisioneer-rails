require 'rails/generators/base'

module Revisioneer
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      namespace "revisioneer"

      desc "Creates a Revisioneer initializer and a revisioneer.yml for your credentials."

      argument :api_token, type: :string

      def copy_config_yml
        template "revisioneer.yml", "config/revisioneer.yml"
      end

      def copy_initializer
        copy_file "revisioneer.rb", "config/initializers/revisioneer.rb"
      end

      def generate_route
        revisioneer_route = 'mount RevisioneerRails::Engine => "/revisions"'
        route revisioneer_route
      end
    end
  end
end
