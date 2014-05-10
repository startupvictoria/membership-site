class RegistrationPage < SimpleDelegator
  def visit
    super("/buy")
  end

  def enter_valid_personal_details
    enter_personal_details(
      full_name: "Peter Gregory",
      email: "peter@hooli.com",
      password: "c1cadas"
    )
  end

  def enter_valid_payment_details
    next_month = Time.now.next_month
    find_stripe_field("number").set("4242424242424242")
    find_stripe_field("exp-month").set(next_month.strftime("%m"))
    find_stripe_field("exp-year").set(next_month.year)
    find_stripe_field("cvc").set(123)
  end

  def enter_personal_details(attrs={})
    fill_in "membership_registration_form[full_name]", with: attrs[:full_name]
    fill_in "membership_registration_form[email]",     with: attrs[:email]
    fill_in "membership_registration_form[password]",  with: attrs[:password]
  end

  def submit_registration
    click_button "Register"
  end

  private

  def find_stripe_field(name)
    find(:xpath, "//input[@data-stripe='#{name}']")
  end
end
