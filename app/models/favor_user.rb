class FavorUser < ActiveRecord::Base
  # Relationships
  # -----------------------------
  belongs_to :user
  belongs_to :favor

  # Scopes
  # -----------------------------
  scope :favor_id, ->(favor_id) { where('favor_id = ?', favor_id) }
  scope :for_user,    ->(user_id) { where('user_id = ?', user_id) }
  scope :by_user,     -> { joins(:user).order('users.lname, users.fname') }
  scope :by_favor,  -> { joins(:favor).order('favor.item') }


  # Validations
  # -----------------------------
  validates_presence_of :user, :favor
  validate :user_is_active_in_system
  validate :favor_is_current_in_system, on: :create

  # Other methods
  # -----------------------------
  private
  def user_is_active_in_system
    all_active_users = User.active.to_a.map{|u| u.id}
    unless all_active_users.include?(self.user_id)
      errors.add(:user_id, "is not an active user in the system")
    end
  end

  def favor_is_current_in_system
    all_current_favors = Favor.current.to_a.map{|p| p.id}
    unless all_current_favors.include?(self.favor_id)
      errors.add(:favor_id, "is not a current favor in the system")
    end
  end

end
