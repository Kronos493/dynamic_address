class ContactNumber < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
end