class PostalCode < ActiveRecord::Base
  translates :locality
  store_accessor :locality
  belongs_to :zone
  validates :zip_code, presence: true
end