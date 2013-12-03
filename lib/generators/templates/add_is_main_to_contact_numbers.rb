class AddIsMainToContactNumbers < ActiveRecord::Migration
  def change
    add_column :contact_numbers, :is_main, :boolean
  end
end
