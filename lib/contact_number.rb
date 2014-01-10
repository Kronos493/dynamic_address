class ContactNumber < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  CONTACT_TYPE = %w[mobile landline fax]
  validates :contact_type, inclusion: { :in => CONTACT_TYPE }
  validates :number, presence: true
end