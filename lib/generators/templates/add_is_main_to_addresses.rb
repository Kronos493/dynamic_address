class AddIsMainToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :is_main, :boolean
  end
end
