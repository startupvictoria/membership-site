require 'spec_helper'

describe CreatesMembership, :vcr do
  let(:user) { User.create!(
    email: "bob@bob.com",
    full_name: "Bob",
    password: "stahtahp"
  ) }
  let(:plan) { MembershipPlan.premium }
  let(:card_token) { get_card_token_for_valid_card }

  subject(:creator) { CreatesMembership.new(
    user: user,
    plan: plan,
    card_token: card_token
  ) }

  it "creates a Customer record" do
    creator.call

    expect(user.customer.stripe_card_id).to be_present
  end

  it "creates a Membership record" do
    creator.call

    expect(user.membership).to be_present
    expect(user.membership.plan_id).to eq(plan.id)
  end

  it "subscribes the user to the membership plan" do
    creator.call

    customer = Stripe::Customer.retrieve(user.customer.stripe_id)
    subscription = customer.subscriptions.first

    expect(subscription.plan.id).to eq(plan.id)
    expect(subscription.plan.amount).to eq(plan.price_cents)
  end
end
