# frozen_string_literal: true

module Sblogistica
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def generate_install
      copy_file 'sblogistica.yml', 'config/sblogistica.yml'
      copy_file 'sblogistica.rb', 'config/initializers/sblogistica.rb'
    end
  end
end

