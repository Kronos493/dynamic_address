class Address < ActiveRecord::Base
  translates :building_name, :street_name, 
    :road, :province_name, :district_name, :sub_district_name,
    :extra_info

  validates :addressable, presence: true

  belongs_to :addressable, polymorphic: true
  belongs_to :buildingable, polymorphic: true

  validate :dynamic_validation

  # def fetch_data_from_postal_code
  #   if postal_code
  #     Setting.available_locales.each do |lang|
  #       Globalize.with_locale(lang) do
  #         self.assign_attributes(postal_code.locality)
  #       end
  #     end
  #     nil
  #   end
  # end

  # def fetch_data_from_building
  #   if buildingable
  #     block_building_attributes = %w[id buildingable_id buildingable_type
  #                                   addressable_id addressable_type
  #                                   created_at updated_at]
  #     building_address_attributes = buildingable.addresss.attributes
  #     building_address_attributes.delete_if do |key,value|
  #       block_building_attributes.include?(key) || value.blank?
  #     end
  #   end
  # end

  def dynamic_validation
    if Setting["#{addressable_type.tableize}_address"].present?
      Setting["#{addressable_type.tableize}_address"].each do |key, value|
        errors.add(key, I18n.t('errors.messages.blank')) if value && try(key).blank?
      end
    end
  end
end