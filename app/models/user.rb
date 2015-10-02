class User < ActiveRecord::Base
  has_many :addresses, :through => :address_user
  has_many :creditcards
  has_many :favors, :through => :favors_user
end
