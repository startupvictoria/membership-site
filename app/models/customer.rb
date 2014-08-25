class Customer < ActiveRecord::Base
  audited

  belongs_to :user

  has_one :membership,
    dependent: :destroy
end
