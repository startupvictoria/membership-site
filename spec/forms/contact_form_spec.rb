require 'spec_helper'
require 'shoulda/matchers'

describe ContactForm do
  let(:full_name) { "Peter Gregory" }
  let(:email) { "peter@hooli.com" }
  let(:phone) { "123" }
  let(:message) { "blah" }
  let(:attributes) { {
    full_name: full_name,
    email: email,
    phone: "123",
    message: "blah"
  } }

  subject(:form) { ContactForm.new(attributes) }

  it { is_expected.to validate_presence_of(:full_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value("foo@bar.com").for(:email) }
  it { is_expected.not_to allow_value("foobar.com").for(:email) }
  it { is_expected.to validate_presence_of(:message) }

  it "sends a contact email" do
    expect do
      expect(form.save).to eq(true)
    end.to change { ActionMailer::Base.deliveries.size }.by(1)
  end
end
