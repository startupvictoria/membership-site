require 'spec_helper'

describe Membership do
  describe "validation" do
    let(:valid_member) { Membership.new(plan_id: "premium") }
    let(:invalid_member) { Membership.new(plan_id: "blah") }

    it "is not made invalid when plan_id is 'premium'" do
      expect(valid_member).to be_valid
    end

    it "is invalid when plan_id isn't a valid MembershipPlan" do
      expect(invalid_member).to_not be_valid
    end
  end
end
