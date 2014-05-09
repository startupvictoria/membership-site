require 'spec_helper'
require 'shoulda/matchers'

describe MembershipRegistrationForm do
  let(:full_name) { "Peter Gregory" }
  let(:email) { "peter@hooli.com" }
  let(:password) { "c1cadas" }
  let(:attributes) { {
    full_name: full_name,
    email: email,
    password: password,
  } }

  subject(:form) { MembershipRegistrationForm.new(attributes) }

  it { is_expected.to validate_presence_of(:full_name) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value("foo@bar.com").for(:email) }
  it { is_expected.not_to allow_value("foobar.com").for(:email) }
  it { is_expected.to ensure_length_of(:password).
                      is_at_least(PasswordPolicy::MINIMUM_LENGTH) }

  it "creates a new User with the given attributes when saved" do
    expect(form.save).to eq(true)

    expect(form.user).to be_persisted
    expect(form.user.email).to eq(email)
    expect(form.user.full_name).to eq(full_name)
  end
end
