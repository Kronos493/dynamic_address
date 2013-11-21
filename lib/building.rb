class Building < ActiveRecord::Base
  translates :name
  has_one :address
end