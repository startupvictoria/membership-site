require 'acceptance_spec_helper'

feature "password reset" do
  scenario "I can request a password reset for my email address" do
    User.create!(email: "bob@example.com", password: "iforgot", full_name: "Bob")

    page = ForgotPasswordPage.new(self)
    page.visit

    expect(page).to have_content("Forgot Password")

    page.request_reset_for("bob@example.com")

    expect(page).to have_content("Check your email for password reset instructions")
  end

  scenario "I can use the reset token I received to provide a new password" do
    user = User.create!(email: "bob@example.com", password: "iforgot", full_name: "Bob")
    token = PasswordResetToken.create!(user: user, token: "atoken", active: true)

    page = UpdatePasswordPage.new(self, token)
    page.visit

    expect(page).to have_content("Update Password")

    page.enter_new_password("this_will_not_happen_again")

    expect(page).to have_content("Your password has been reset")
  end
end
