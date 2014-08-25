class Membership < ActiveRecord::Base
  audited

  belongs_to :customer
end
