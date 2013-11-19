class CreatePostalCodes < ActiveRecord::Migration
  def change
    create_table :postal_codes do |t|
      t.integer :address_id
      t.integer :zip_code
      t.hstore :locality

      t.timestamps
    end

    PostalCode.create_translation_table! locality: :hstore
  end
end
