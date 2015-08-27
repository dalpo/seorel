# models
class Post < ActiveRecord::Base
end

#migrations
class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:posts) do |t|
      t.string :title
      t.string :image
      t.text :description
    end
  end
end
ActiveRecord::Migration.verbose = false
CreateAllTables.up
