require 'acceptance_spec_helper'

feature "'contact us' form" do
  scenario "I can send a message" do
    page = ContactUsPage.new(self)
    page.visit

    page.enter_name("Bob")
    page.enter_email("bob@example.com")
    page.enter_phone_number("123456")
    page.enter_message("hello startup victoria")

    page.submit_message

    expect(page).to have_content("Your message has been sent")
  end

  scenario "I see an error message when I enter invalid details" do
    page = ContactUsPage.new(self)
    page.visit

    page.enter_name("Bob")
    page.enter_email("blarghn")
    page.enter_message("hello startup victoria")

    page.submit_message

    expect(page).to have_content("Email is invalid")
  end
end
