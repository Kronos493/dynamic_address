class AddStateNameToAddressTranslations < ActiveRecord::Migration
  def change
    add_column :address_translations, :state_name, :string
  end
end
