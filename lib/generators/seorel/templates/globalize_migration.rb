class CreateSeorelTranslations < ActiveRecord::Migration
  def up
    Seorel::Seorel.create_translation_table!({
                                               title: :string,
                                               description: :string,
                                               image: :string
                                             }, migrate_data: true)
  end

  def down
    Seorel::Seorel.drop_translation_table!
  end
end
