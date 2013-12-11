class AddressType < ActiveRecord::Base
  translates :name
  has_many :addresses
  validates :name, presence: true
end