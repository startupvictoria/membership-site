class User < ActiveRecord::Base
  has_secure_password

  has_one :customer,
    dependent: :destroy

  has_one :membership,
    through: :customer

  enum faction: { unknown: 0, non_founder: 1, aspiring_founder: 2, practising_founder: 3 }
end
