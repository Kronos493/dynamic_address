class Zone < ActiveRecord::Base
  translates :name
  has_many :postal_codes
  validates :name, presence: true

  extend HstoreValidation

  validates_hstore :variables, :condition do
    validates "level", presence: true
    validates "area", presence: true
  end

  def variables
    super || {}
  end

  def condition
    Setting.delivery_calculator == "Calculator::Charges::Level"
  end
end
