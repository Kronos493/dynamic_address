class AddressType < ActiveRecord::Base
  default_scope -> { joins(:translations).includes(:translations) }
  
  translates :name
  has_many :addresses
  validates :name, presence: true
end