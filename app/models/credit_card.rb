class CreditCard < ActiveRecord::Base
  # Relationships
  # -----------------------------
  belongs_to :user
  has_one :address

  # Scopes
  # -----------------------------

  # Validates
  # -----------------------------
  validates_presence_of :csv, :expmonth, :expyear, :number, :lname, :fname, :address
  validates :csv, length: 3
  validates :number, length: 16
  validates :expmonth, inclusion: {in: 0..13}
  validates :expyear, inclusion: {in: 2000..2100}
end
