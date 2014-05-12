class User < ActiveRecord::Base
  has_secure_password

  has_one :customer,
    dependent: :destroy

  has_one :membership,
    through: :customer

  enum faction: { unassigned: 0, civilian: 1, aspirant: 2, practitioner: 3 }
end
