class Address < ActiveRecord::Base
  default_scope -> { includes(:translations).references(:translations) }

  translates :building_name, :street_name,
    :road, :province_name, :district_name, :sub_district_name,
    :extra_info, :city_name, :state_name, :company_name

  belongs_to :addressable, polymorphic: true
  belongs_to :buildingable, polymorphic: true
  belongs_to :address_type

  belongs_to :contact_number

  has_one :code, foreign_key: "zip_code", class_name: "PostalCode", primary_key: "postal_code"
  has_one :zone, through: :code

  validate :dynamic_validation

  def display_address_text
    eval Setting.display_address_text
  end

  def self.display_address_text(hash)
    return if hash.blank?
    condition_text = Setting.display_address_text
    Setting.display_address_text.scan( /(\w+)/ ).each do |match_text|
      text = match_text.first
      puts text
      condition_text.gsub! text, "hash['#{text}']"
    end
     eval condition_text
  end

  def dynamic_validation
    if Setting["#{addressable_type.downcase}_address"].present?
      Setting["#{addressable_type.downcase}_address"].each do |key, value|
        if value && try(key).blank? && try(key) != false
          errors.add(key, I18n.t('errors.messages.blank'))
        end
      end
    end
    if address_type.present? && Setting["#{address_type.reference.downcase}_address"].present?
      Setting["#{address_type.reference.downcase}_address"].each do |key, value|
        if value && try(key).blank? && try(key) != false
          errors.add(key, I18n.t('errors.messages.blank'))
        end
      end
    end
  end
end
