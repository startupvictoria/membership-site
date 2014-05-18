require 'spec_helper'
require 'shoulda/matchers'

describe PasswordResetForm do
  let(:user) { User.create!(
    email: "bob@example.com",
    full_name: "Bob",
    password: "waslost"
  ) }
  let(:email) { user.email }

  subject(:form) { described_class.new(email: email) }

  it "creates a password reset token for the user with the given email" do

    expect do
      expect(form.save).to eq(true)
    end.to change { user.password_reset_tokens.count }.by(1)
  end

  it "sends a password reset email" do
    expect do
      expect(form.save).to eq(true)
    end.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it "de-activates existing tokens when an active token already exists" do
    token = PasswordResetToken.create!(user: user, token: "a", active: true)

    expect(form.save).to eq(true)

    token.reload
    new_token = user.password_reset_tokens.last
    expect(token).not_to be_active
    expect(new_token).to be_active
  end

  context "when no user with the given email address exists" do
    let(:email) { "nope@example.com" }

    it "is invalid when no user with the given email exists" do
      expect(form).not_to be_valid
      expect(form.save).to eq(false)
      expect(form.errors.messages).to eq(email: ["is invalid."])
    end
  end
end
