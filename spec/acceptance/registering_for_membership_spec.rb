require 'acceptance_spec_helper'

feature "registering for membership", :vcr do
  if ENV['STRIPE_PUBLISHABLE_KEY'].blank?
    pending "isn't tested.  Please contact Startup Victoria to get a valid STRIPE_PUBLISHABLE_KEY"
  else
    context "when I go to the registration page directly" do

      scenario "I can register for a membership" do
        page = RegistrationPage.new(self)
        page.visit_directly

        page.enter_valid_personal_details
        page.enter_valid_payment_details
        page.submit_registration

        expect(page).to have_content("Payment Complete.  Welcome to Startup Victoria!")
      end

      describe "I see an error when my registration fails" do
        scenario "because I entered an invalid credit card" do
          page = RegistrationPage.new(self)
          page.visit_directly

          page.enter_valid_personal_details
          page.enter_invalid_payment_details
          page.submit_registration

          expect(page).to have_content("Your card was declined")
        end

        scenario "because I tried to register using an existing email address" do
          page = RegistrationPage.new(self)
          page.visit_directly

          page.create_user_beforehand
          page.enter_valid_personal_details
          page.enter_valid_payment_details
          page.submit_registration

          expect(page).to have_content("This email address is already a member")
        end
      end
    end

    context "when I go to the registration page via the home and membership pages" do
      scenario "I can register for a membership" do
        page = RegistrationPage.new(self)
        page.visit_via_home_and_memberships_pages

        page.enter_valid_personal_details
        page.enter_valid_payment_details
        page.submit_registration

        expect(page).to have_content("Payment Complete.  Welcome to Startup Victoria!")
      end
    end
  end
end
