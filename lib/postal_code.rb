class PostalCode < ActiveRecord::Base
  translates :locality
  store_accessor :locality
  belongs_to :zone
  validates :number, presence: true
end