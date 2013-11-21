class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.integer :buildingable_id
      t.integer :buildingable_type
      t.integer :postal_code_id
      t.string :building_number
      t.string :building_name
      t.string :street_name
      t.string :floor
      t.string :province_name
      t.string  :district_name
      t.string :sub_district_name
      t.decimal :latitude, precision: 15, scale: 12
      t.decimal :longitude, precision: 15, scale: 12
      t.text :extra_info

      t.timestamps
    end

    add_index :addresses, [:addressable_id, :addressable_type]
    add_index :addresses, [:buildingable_id, :buildingable_type]

    Address.create_translation_table! building_name: :string, street_name: :string, 
    street_name: :string, province_name: :string, district_name: :string, sub_district_name: :string,
    extra_info: :text
  end
end
