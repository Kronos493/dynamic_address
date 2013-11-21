class Building < ActiveRecord::Base
  translates :name
  has_one :address, :as => :addressable
end