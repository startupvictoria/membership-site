class User < ActiveRecord::Base
  audited

  validates :email, uniqueness: true, on: :create

  has_secure_password

  has_one :customer,
    dependent: :destroy

  has_one :membership,
    through: :customer

  has_many :password_reset_tokens,
    dependent: :destroy

  enum faction: { unassigned: 0, civilian: 1, aspirant: 2, practitioner: 3 }

  scope :with_membership, -> { joins(:membership) }

  scope :with_membership_plan, ->(id) { joins(:membership).where("memberships.plan_id = (?)", id) }

  scope :created_last_n_days, ->(n) { where("users.created_at >= ?", n.days.ago) }

  def membership_number
    membership.nil? ? nil : membership.id
  end

  def is_member?
    !membership_number.nil?
  end
end
