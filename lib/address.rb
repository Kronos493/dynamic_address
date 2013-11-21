class Address < ActiveRecord::Base
  translates :building_name, :street_name, 
    :street_name, :province_name, :district_name, :sub_district_name,
    :extra_info

  belongs_to :addressable, polymorphic: true

  belongs_to :postal_code



  def fetch_data_from_postal_code
    if postal_code
      Setting.available_locales.each do |x|
        Globalize.with_locale(x) do
          self.assign_attributes(postal_code.locality)
        end
      end
      nil
    end
  end
end