class CreatePostalCodes < ActiveRecord::Migration
  def up
    create_table :postal_codes do |t|
      t.integer :zip_code
      t.hstore :locality

      t.timestamps
    end

    PostalCode.create_translation_table! locality: :string
    remove_column :postal_code_translations, :locality
    add_column :postal_code_translations, :locality, :hstore, after: :locale
  end

  def down
    drop_table :postal_codes
    PostalCode.drop_translation_table!
  end
end
