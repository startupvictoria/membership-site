require 'spec_helper'

describe MembershipCreatedMailer do
  let(:user) { User.create!(email: "bob@example.com", full_name: "Bob", password: "xxx") }

  subject(:mail) { MembershipCreatedMailer.create(user.id) }

  it "is send to user of the given token" do
    expect(mail.to).to eq([user.email])
  end

  it "includes 'welcome' in the subject line" do
    expect(mail.subject).to include("Welcome")
  end

  it "includes a link to login" do
    expect(mail.body).to include("login")
  end
end
