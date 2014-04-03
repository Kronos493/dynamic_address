class ContactNumber < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  CONTACT_TYPE = %w[mobile landline fax1 fax2 fax3 ]
  validates :contact_type, inclusion: { :in => CONTACT_TYPE }
  validates :number, presence: true, uniqueness: true
  validate :number_should_be_correct

  CONTACT_TYPE.each do |contact_type|
    scope contact_type, -> { where(contact_type: contact_type) }
  end

  def self.main_number
    where(is_main: true).first
  end

  def number_should_be_correct
    if number.present? && (number =~ /^(?:\+?\d{2})?\d{8,10}$/).blank?
      errors[:number] << "is invalid"
    end
  end
end
