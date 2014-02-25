class PostalCode < ActiveRecord::Base
  default_scope -> { joins(:translations).includes(:translations) } 
  
  translates :locality
  store_accessor :locality
  belongs_to :zone
  validates :zip_code, presence: true
end