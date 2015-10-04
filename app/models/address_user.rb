class AddressUser < ActiveRecord::Base
  # Relationships
  # -----------------------------
  belongs_to :user
  belongs_to :address

  # Scopes
  # -----------------------------
  scope :address_id, ->(address_id) { where('address_id = ?', address_id) }
  scope :for_user,    ->(user_id) { where('user_id = ?', user_id) }
  scope :by_user,     -> { joins(:user).order('users.lname, users.fname') }
  scope :by_address,  -> { joins(:address).order('address.name') }


  # Validations
  # -----------------------------
  validates_presence_of :user, :address
  validate :user_is_active_in_system

  # Other methods
  # -----------------------------
  private
  def user_is_active_in_system
    all_active_users = User.active.to_a.map{|u| u.id}
    unless all_active_users.include?(self.user_id)
      errors.add(:user_id, "is not an active user in the system")
    end
  end

end
