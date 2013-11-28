class CreateAddressTypes < ActiveRecord::Migration
  def change
    create_table :address_types do |t|
      t.boolean :inactive
      t.hstore :available_fields

      t.timestamps
    end

    AddressType.create_translation_table! name: :string
  end
end
