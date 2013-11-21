class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.timestamps
    end

    Address.create_translation_table! name: :string
  end
end
