class ChangeZipCodeColumnType < ActiveRecord::Migration
  def change
    change_column :postal_codes, :zip_code, :string
  end
end
