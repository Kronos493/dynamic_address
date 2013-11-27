class CreateAddresses < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.integer :buildingable_id
      t.string :buildingable_type
      t.string :postal_code
      t.string :building_number
      t.string :road
      t.string :floor
      t.decimal :latitude, precision: 15, scale: 12
      t.decimal :longitude, precision: 15, scale: 12

      t.timestamps
    end

    add_index :addresses, [:addressable_id, :addressable_type]
    add_index :addresses, [:buildingable_id, :buildingable_type]

    Address.create_translation_table! building_name: :string, street_name: :string,
    road: :string, province_name: :string, district_name: :string, sub_district_name: :string,
    extra_info: :text
  end

  def down
    drop_table :addresses
    Address.drop_translation_table!
  end
end
