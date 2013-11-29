class AddCityNameToAddressTranslations < ActiveRecord::Migration
  def change
    add_column :address_translations, :city_name, :string
  end
end
