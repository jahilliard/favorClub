class Favor < ActiveRecord::Base
  has_many :favors, :through => :favors_user
  has_many :users, :through => :favors_user
  has_one :address
end
