class ContactNumber < ActiveRecord::Base
  translates :name
  belongs_to :contactable, polymorphic: true
  has_many :addresses
end