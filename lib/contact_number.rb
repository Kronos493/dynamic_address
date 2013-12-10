class ContactNumber < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  CONTACT_TYPE = %w[mobile landline]
  validates :contact_type, inclusion: { :in => CONTACT_TYPE }
end