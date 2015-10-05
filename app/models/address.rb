class Address < ActiveRecord::Base
  # Relationships
  # -----------------------------
  has_many :users, :through => :addressUser
  has_many :addressUser

  # Scopes
  # -----------------------------

  # Validations
  # -----------------------------
  validates_presence_of :streetAddress, :city, :zipCode, :lat, :long, :state


  # Other Methods
  # -----------------------------
  def self.nearLocation
    return Favor.near([lat, long], 5).newestFavor.active.to_a
  end


end
