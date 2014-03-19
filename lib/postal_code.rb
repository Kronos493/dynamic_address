class PostalCode < ActiveRecord::Base
  default_scope -> { includes(:translations).references(:translations) } 
  
  translates :locality
  store_accessor :locality
  belongs_to :zone
  validates :zip_code, presence: true
end