class RegistrationPage < SimpleDelegator
  def visit
    super("/buy")
  end

  def enter_valid_personal_information
    enter_personal_information(
      full_name: "Peter Gregory",
      email: "peter@hooli.com",
      password: "c1cadas"
    )
  end

  def enter_personal_information(attrs={})
    fill_in "membership_registration_form[full_name]", with: attrs[:full_name]
    fill_in "membership_registration_form[email]",     with: attrs[:email]
    fill_in "membership_registration_form[password]",  with: attrs[:password]
  end

  def submit_registration
    click_button "Register"
  end
end
