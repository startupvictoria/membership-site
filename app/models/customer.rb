class Customer < ActiveRecord::Base
  belongs_to :user

  has_one :membership,
    dependent: :destroy
end
