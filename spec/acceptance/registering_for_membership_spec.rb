require 'acceptance_spec_helper'

feature "registering for membership", vcr: true do
  scenario "I can register for a membership when I am logged out" do
    page = RegistrationPage.new(self)
    page.visit

    page.enter_valid_personal_details
    page.enter_valid_payment_details
    page.submit_registration

    expect(page).to have_content("Successfully registered")
  end
end
