class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.timestamps
    end

    Building.create_translation_table! name: :string
  end
end
