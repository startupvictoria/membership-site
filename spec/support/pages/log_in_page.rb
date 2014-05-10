class LogInPage < SimpleDelegator
  def visit
    super("/login")
  end

  def enter_email(email)
    fill_in "log_in_form[email]", with: email
  end

  def enter_password(password)
    fill_in "log_in_form[password]", with: password
  end

  def submit
    within ".Page-content" do
      click_on "Login"
    end
  end
end
