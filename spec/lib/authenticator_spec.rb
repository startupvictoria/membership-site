require 'authenticator'

describe Authenticator do
  let(:session) { {} }
  let(:authenticator) { Authenticator.new(session) }

  describe "#log_in" do
    it "sets the session user_id to the given User ID" do
      user = double(id: 123)
      authenticator.log_in(user)
      expect(session[:user_id]).to eq(123)
    end
  end

  describe "#logged_in?" do
    context "when logged in" do
      let(:session) { {user_id: 123} }
      before do
        authenticator.user_finder = ->(id) { double(:user) }
      end

      it "is true" do
        expect(authenticator.logged_in?).to eq(true)
      end
    end

    context "when logged out" do
      it "is false" do
        expect(authenticator.logged_in?).to eq(false)
      end
    end
  end

  describe "#current_user" do
    context "when logged in" do
      let(:session) { {user_id: 123} }
      let(:user) { double(:user) }

      before do
        authenticator.user_finder = ->(id) { user }
      end

      it "is the authenticated User instance" do
        expect(authenticator.current_user).to be(user)
      end
    end

    context "when logged out" do
      it "is an AnonUser instance" do
        expect(authenticator.current_user).to be_a(Authenticator::AnonUser)
      end
    end
  end

  describe "#log_out" do
    let(:session) { {user_id: 123} }

    it "removes the user_id from the session" do
      authenticator.log_out
      expect(session).to eq({})
    end
  end
end
