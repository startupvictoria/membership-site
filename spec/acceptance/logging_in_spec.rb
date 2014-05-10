require 'acceptance_spec_helper'

feature "logging in" do
  scenario "I can log in from the home page" do
    User.create!(
      password: "att1cus",
      email: "atticus@gmail.com",
      full_name: "atty"
    )

    log_in_page = LogInPage.new(self)
    log_in_page.visit

    log_in_page.enter_email("atticus@gmail.com")
    log_in_page.enter_password("att1cus")
    log_in_page.submit

    expect(page).to have_content("Logout")
  end
end
