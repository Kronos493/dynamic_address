class Zone < ActiveRecord::Base
  translates :name
  has_many :postal_codes
  validates :name, presence: true

  extend HstoreValidation

  validates_hstore :variables, true do
    validates "level", presence: true if Setting.delivery_calculator == "Calculator::Charges::Level"
  end

  def variables
    super || {}
  end
end
