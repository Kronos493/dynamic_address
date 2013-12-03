class AddCompanyNameToAddressTranslations < ActiveRecord::Migration
  def change
    add_column :address_translations, :company_name, :string
  end
end
