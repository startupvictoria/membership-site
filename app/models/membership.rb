class Membership < ActiveRecord::Base
  audited

  validates :plan_id,
    inclusion: {
      in: MembershipPlan.all,
      message: "%{value} is not a valid MembershipPlan.id" }

  belongs_to :customer
end
