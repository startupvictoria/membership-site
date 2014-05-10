require 'spec_helper'

describe LogInForm do
  let!(:user) { User.create!(
    email: "bob@bobbob.bob",
    password: "bobbobbob",
    full_name: "Bob"
  ) }

  let(:email) { "bob@bobbob.bob" }
  let(:password) { "bobbobbob" }
  let(:authenticator) { double("Authenticator") }

  subject(:form) { LogInForm.new(
    email: email,
    password: password,
    authenticator: authenticator
  ) }

  it "logs the user in using the given authenticator" do
    expect(authenticator).to receive(:log_in).with(user)

    expect(form.save).to eq(true)
  end

  shared_examples_for "an invalid log in attempt" do
    it "does not log the user in" do
      expect(authenticator).not_to receive(:log_in)

      form.save
    end

    it "is invalid adds form errors" do
      expect(form.save).to eq(false)
      expect(form.errors.messages).to eq(email: ["or password is invalid"])
    end
  end

  context "when the given password does not match" do
    let(:password) { "asdasd" }

    it_behaves_like "an invalid log in attempt"
  end

  context "when the given email does not match" do
    let(:email) { "bar@bar.com" }

    it_behaves_like "an invalid log in attempt"
  end
end
