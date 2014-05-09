require 'acceptance_spec_helper'

feature "registering for membership" do
  context "when I am logged out" do
    it "allows me register as a member" do
      page = RegistrationPage.new(self)
      page.visit

      page.enter_valid_personal_information
      page.submit_registration

      expect(page).to have_content("Successfully registered")
    end

    it "displays errors when I submit invalid details" do
      page = RegistrationPage.new(self)
      page.visit

      page.enter_personal_information(email: "bob")
      page.submit_registration

      expect(page).to have_content("Email is invalid")
    end
  end
end
