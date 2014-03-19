class AddressType < ActiveRecord::Base
  default_scope -> { includes(:translations).references(:translations) }
  
  translates :name
  has_many :addresses
  validates :name, presence: true
end