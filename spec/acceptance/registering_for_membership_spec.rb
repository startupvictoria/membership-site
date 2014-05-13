require 'acceptance_spec_helper'

feature "registering for membership", :vcr do
  scenario "I can register for a membership when I am logged out" do
    page = RegistrationPage.new(self)
    page.visit

    page.enter_valid_personal_details
    page.enter_valid_payment_details
    page.submit_registration

    expect(page).to have_content("Payment Complete.  Welcome to Startup Victoria!")
  end

  scenario "I see errors when my registration fails" do
    page = RegistrationPage.new(self)
    page.visit

    page.enter_valid_personal_details
    page.enter_invalid_payment_details
    page.submit_registration

    expect(page).to have_content("Your card was declined")
  end
end
