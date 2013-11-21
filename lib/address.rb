class Address < ActiveRecord::Base
  translates :building_name, :street_name, 
    :street_name, :province_name, :district_name, :sub_district_name,
    :extra_info

  belongs_to :addressable, polymorphic: true

  belongs_to :postal_code

  validate :dynamic_validation

  def fetch_data_from_postal_code
    if postal_code
      Setting.available_locales.each do |lang|
        Globalize.with_locale(lang) do
          self.assign_attributes(postal_code.locality)
        end
      end
      nil
    end
  end

  def dynamic_validation
    if Setting.try("#{addressable_type}_address").present?
      Setting.try("#{addressable_type}_address").each do |key, value|
        errors.add(key, t('errors.messages.blank')) if value && try(key).blank?
      end
    end
  end
end