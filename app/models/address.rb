class Address < ActiveRecord::Base
  has_many :users, :through => :addresses_users
end
