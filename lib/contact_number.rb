class ContactNumber < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  has_many :addresses
end