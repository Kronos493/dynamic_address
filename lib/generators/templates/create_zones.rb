class CreateZones < ActiveRecord::Migration
  def up
    create_table :zones do |t|

      t.timestamps
    end
     Zone.create_translation_table! name: :string
  end

  def down
    drop_table :zones
    Zone.drop_translation_table!
  end
end
