class User < ActiveRecord::Base
  # Relationships
  # -----------------------------
  has_many :addresses, :through => :address_user
  has_many :creditcards
  has_many :favors, :through => :favors_user

  # Scopes
  # -----------------------------
  scope :alphabetical, -> { order("lname, fname") }

  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :fname, :lname, :email
  validates_uniqueness_of :email, allow_blank: true
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_presence_of :password, on: :create
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true

  # Other methods
  # -----------------------------
  def proper_name
    fname + " " + lname
  end

  def name
    lname + ", " + fname
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
  def self.authenticate(email, password)
    find_by_email(email).try(password)
  end
end
