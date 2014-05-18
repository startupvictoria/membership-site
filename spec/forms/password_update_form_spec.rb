require 'spec_helper'
require 'shoulda/matchers'

describe PasswordUpdateForm do
  let!(:user) { User.create!(email: "bob@example.com", password: "iforgot", full_name: "Bob") }
  let!(:token) { PasswordResetToken.create!(user: user, token: "atoken", active: true) }
  let(:password) { "a_shiny_new_password" }

  subject(:form) { PasswordUpdateForm.new(token: token, password: password) }

  it { is_expected.to ensure_length_of(:password).
                      is_at_least(PasswordPolicy::MINIMUM_LENGTH) }

  it "updates the user's password" do
    expect do
      expect(form.save).to eq(true)
    end.to change { user.password }.to eq(password)
  end

  it "de-activates the token" do
    expect do
      expect(form.save).to eq(true)
    end.to change { token.active? }.to eq(false)
  end

  it "errors if the token is not active" do
    token.deactivate

    expect(form.save).to eq(false)
    expect(form.errors.messages).to eq(token: ["is invalid"])
  end
end
