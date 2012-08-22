class CreateSeorelSeoContents < ActiveRecord::Migration
  def change
    create_table :seorel_seo_contents do |t|
      t.string :title
      t.string :description
      t.references :seorelable

      t.timestamps
    end
    add_index :seorel_seo_contents, :seorelable_id
  end
end
