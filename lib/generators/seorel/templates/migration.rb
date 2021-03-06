class CreateSeorel < ActiveRecord::Migration[4.2]
  def self.up
    create_table :seorel_seorels do |t|
      t.string :title
      t.string :description
      t.string :image
      t.references :seorelable, polymorphic: true

      t.timestamps
    end

    add_index :seorel_seorels, %i[seorelable_id seorelable_type]
  end

  def self.down
    drop_table :seorel_seorels
  end
end
