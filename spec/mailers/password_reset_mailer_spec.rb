require 'spec_helper'

describe PasswordResetMailer do
  let(:user) { User.create!(email: "bob@example.com", full_name: "Bob", password: "waslost") }
  let(:token) { PasswordResetToken.create!(user: user, token: "a", active: true) }

  subject(:mail) { PasswordResetMailer.reset_password(token) }

  it "is send to user of the given token" do
    expect(mail.to).to eq([user.email])
  end

  it "includes a link to use the token" do
    expect(mail.body).to include("forgot-password/#{token.token}")
  end
end
