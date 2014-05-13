class User < ActiveRecord::Base
  has_secure_password

  has_one :customer,
    dependent: :destroy

  has_one :membership,
    through: :customer

  def admin?
    true
  end
end
