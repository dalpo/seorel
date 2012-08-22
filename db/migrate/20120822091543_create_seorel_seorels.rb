class CreateSeorelSeorels < ActiveRecord::Migration
  def change
    create_table :seorel_seorels do |t|
      t.string :title
      t.string :description
      t.references :seorelable, polymorphic: true

      t.timestamps
    end
    
    add_index :seorel_seorels, :seorelable_id
    add_index :seorel_seorels, :seorelable_type
    add_index :seorel_seorels, [:seorelable_id, :seorelable_type]
  end
end
