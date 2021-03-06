class Favor < ActiveRecord::Base
  # Relationships
  # -----------------------------
  has_many :users, :through => :favorUser
  has_one :address
  has_many :favorUser

  # Scopes
  # -----------------------------
  scope :newestFavor, -> { order("created_at DESC")}
  scope :active, -> { where("acitive = ?", true) }
  scope :notActive, -> { where("acitive = ?", false) }

  # Validations
  # -----------------------------
  # validates_presence_of :item, :description, :price, :requestLive, :user, :address


  # Other Methods
  # -----------------------------
  def self.nearLocation
    return Favor.near([lat, long], 5).newestFavor.active.to_a
  end

  def self.usersWithOpenFavors
    favUser = []
    (self.all).each do |e|
      h = {}
      h[:fname] = e.users[0].fname
      h[:lname] = e.users[0].lname
      h[:favor] = e
      favUser << h
    end
    return favUser
  end


  def setInactive
    Favor.active.each do |a|
      if Time.now >= a.created_at + a.requestLive
        a.active = false
        a.save!
      end
    end
  end
end
