# Models
class Post < ActiveRecord::Base
end

# Migrations
load Seorel::Engine.root.join('lib/generators/seorel/templates/migration.rb')

class CreateAllTables < ActiveRecord::Migration[4.2]
  def self.up
    create_table(:posts) do |t|
      t.string :title
      t.string :image
      t.text :description
    end
  end
end

ActiveRecord::Migration.verbose = true
CreateSeorel.up
CreateAllTables.up
