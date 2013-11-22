class PostalCode < ActiveRecord::Base
  translates :locality
  store_accessor :locality
end