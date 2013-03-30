# encoding: utf-8
module Seorel
  class ConfigGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    def copy_config_file
      template 'seorel_config.rb', 'config/initializers/seorel_config.rb'
    end

  end
end
