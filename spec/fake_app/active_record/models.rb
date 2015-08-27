# models
class Post < ActiveRecord::Base
end

#migrations
load Seorel::Engine.root.join('db/migrate/20120822091543_create_seorel_seorels.rb')
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
