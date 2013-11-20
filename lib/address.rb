class Address < ActiveRecord::Base
  translates :building_name, :street_name, 
    :street_name, :province_name, :district_name, :sub_district_name,
    :extra_info

  belongs_to :addressable, polymorphic: true

  belongs_to :postal_code
end