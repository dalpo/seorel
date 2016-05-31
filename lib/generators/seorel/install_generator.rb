require 'rails/generators'
require "rails/generators/active_record"

module Seorel
  # This generator adds a migration and aa configuration initializer
  class InstallGenerator < ActiveRecord::Generators::Base
    # ActiveRecord::Generators::Base inherits from Rails::Generators::NamedBase which requires a NAME parameter for the
    argument :name, type: :string, default: 'random_name'

    class_option :'skip-migration',   type: :boolean, desc: "Don't generate a migration for the seorel table"
    class_option :'skip-initializer', type: :boolean, desc: "Don't generate an initializer"
    class_option :'globalize', type: :boolean, desc: "Don't generate an initializer"

    source_root File.expand_path('../templates', __FILE__)

    # Copies the migration template to db/migrate.
    def create_main_migration
      return if options['skip-migration']
      migration_template 'migration.rb', 'db/migrate/create_seorel.rb'
    end

    def create_globalize_migration
      if options['globalize']
        migration_template 'globalize_migration.rb',
                           'db/migrate/create_seorel_translations.rb'
      end
    end

    def create_initializer
      return if options['skip-initializer']
      copy_file 'initializer.rb', 'config/initializers/seorel.rb'
    end

    def create_locale_file
      copy_file 'seorel.en.yml', 'config/locales/seorel.en.yml'
    end
  end
end
