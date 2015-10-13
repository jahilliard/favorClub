class User < ActiveRecord::Base
  # Relationships
  # -----------------------------
  has_many :addresses, :through => :addressUser
  has_many :addressUser
  has_many :favorUser
  has_many :creditcards
  has_many :favors, :through => :favorUser

  # Scopes
  # -----------------------------
  scope :alphabetical, -> { order("lname, fname") }
  scope :active, -> { where("active is true") }
  scope :username, -> (username){ where("username = ?", username) }

  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :fname, :lname, :email
  validates_uniqueness_of :email, allow_blank: true
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_presence_of :password, on: :create
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  validates :auth_token, uniqueness: true


  before_create :generate_authentication_token!

  # Other methods
  # -----------------------------
  def proper_name
    fname + " " + lname
  end

  def name
    lname + ", " + fname
  end

  def generate_authentication_token!
    tok = Devise.friendly_token
    self.auth_token = tok
    self.save!
  end

  def modRating(exp_rating)
    if exp_rating == true
      self.rating += 1
    else
      self.rating -= 1
    end
    self.save!
  end

  # login by email address
  def self.authenticate(username, password)
    if find_by_username(username).try(password)
      return true
    else
      return false
    end
  end
end
