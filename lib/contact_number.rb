class ContactNumber < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  CONTACT_TYPE = %w[mobile landline fax]
  validates :contact_type, inclusion: { :in => CONTACT_TYPE }
  validates :number, presence: true


  CONTACT_TYPE.each do |contact_type|
    scope contact_type, -> { where(contact_type: contact_type) }
  end

  def self.main_number
    where(is_main: true).first
  end
end
