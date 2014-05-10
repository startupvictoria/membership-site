require 'spec_helper'
require 'shoulda/matchers'

describe MembershipRegistrationForm do
  let(:full_name) { "Peter Gregory" }
  let(:email) { "peter@hooli.com" }
  let(:password) { "c1cadas" }
  let(:card_token) { "tok_123456" }
  let(:attributes) { {
    full_name: full_name,
    email: email,
    password: password,
    card_token: card_token
  } }

  subject(:form) { MembershipRegistrationForm.new(attributes) }

  it { is_expected.to validate_presence_of(:full_name) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value("foo@bar.com").for(:email) }
  it { is_expected.not_to allow_value("foobar.com").for(:email) }
  it { is_expected.to ensure_length_of(:password).
                      is_at_least(PasswordPolicy::MINIMUM_LENGTH) }

  it { is_expected.to validate_presence_of(:card_token) }

  it "creates a new User with the given attributes when saved" do
    allow(CreatesMembership).to receive(:new).and_return(double(call: nil))
    expect(form.save).to eq(true)

    expect(form.user).to be_persisted
    expect(form.user.email).to eq(email)
    expect(form.user.full_name).to eq(full_name)
  end

  it "creates a premium Membership for the new user" do
    membership_creator = double("CreatesMembership")

    expect(CreatesMembership).to receive(:new).with(
      user: form.user,
      plan: MembershipPlan.premium,
      card_token: card_token
    ).and_return(membership_creator)

    expect(membership_creator).to receive(:call)

    form.save
  end

  it "adds stripe errors onto the form" do
    expect(CreatesMembership).to \
      receive(:new).and_raise(Stripe::CardError.new("oops", :foo, nil))

    expect(form.save).to eq(false)
    expect(form.errors.messages).to eq({foo: ["oops"]})
  end
end
