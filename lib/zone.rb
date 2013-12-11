class Zone < ActiveRecord::Base
  translates :name
  has_many :postal_codes
end
