class CreateContactNumbers < ActiveRecord::Migration
  def change
    create_table :contact_numbers do |t|
      t.integer :contactable_id
      t.string :contactable_type
      t.string :contact_type
      t.string :number

      t.timestamps
    end

    add_index :contact_numbers, [:contactable_id, :contactable_type]
  end
end
