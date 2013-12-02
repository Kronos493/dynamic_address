class RemoveFieldContactTypeFromContactNumbers < ActiveRecord::Migration
  def change
    remove_column :contact_numbers, :contact_type, :string
  end
end
