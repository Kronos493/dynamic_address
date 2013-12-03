class AddReferenceToAddressTypes < ActiveRecord::Migration
  def change
    add_column :address_types, :reference, :string
  end
end
