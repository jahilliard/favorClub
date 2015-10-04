class Address < ActiveRecord::Base
  # Relationships
  # -----------------------------
  has_many :users, :through => :addresses_users

  # Scopes
  # -----------------------------

  # Validations
  # -----------------------------
  validates_presence_of :streetAdress, :city, :zip, :lat, :long, :state


  # Other Methods
  # -----------------------------
  def self.nearLocation
    return Favor.near([lat, long], 5).newestFavor.active.to_a
  end


end
