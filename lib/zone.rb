class Zone < ActiveRecord::Base
  translates :name
  has_many :postal_codes
  validates :name, presence: true
end
