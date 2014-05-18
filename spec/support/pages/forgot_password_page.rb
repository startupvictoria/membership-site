class ForgotPasswordPage < SimpleDelegator
  def visit
    super("/forgot-password")
  end

  def request_reset_for(email)
    fill_in "password_reset_form[email]", with: email
    click_on "SEND PASSWORD"
  end
end
