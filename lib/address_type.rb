class AddressType < ActiveRecord::Base
  translates :name
  has_many :addresses
end