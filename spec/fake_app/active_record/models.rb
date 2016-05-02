# Models
class Post < ActiveRecord::Base
end

# Migrations
load Seorel::Engine.root.join('lib/seorel/migration.rb')

class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:posts) do |t|
      t.string :title
      t.string :image
      t.text :description
    end
  end
end

ActiveRecord::Migration.verbose = true
CreateSeorelSeorels.up
CreateAllTables.up
