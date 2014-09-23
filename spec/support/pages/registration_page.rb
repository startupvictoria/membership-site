class RegistrationPage < SimpleDelegator
  def visit_directly
    visit("/memberships/new")
  end

  def visit_via_home_and_memberships_pages
    visit("/")
    visit("/memberships")
    visit("/memberships/new")
  end

  def create_user_beforehand
    User.create!(email: "peter@hooli.com", password: "irrelevant", full_name: "blah")
  end

  def enter_valid_personal_details
    enter_personal_details(
      full_name: "Peter Gregory",
      email: "peter@hooli.com",
      password: "c1cadas",
      phone_number: "0411 111 111"
    )
  end

  def enter_valid_payment_details
    enter_payment_details(card: "4242424242424242")
  end

  def enter_invalid_payment_details
    enter_payment_details(card: "4000000000000341")
  end

  def enter_personal_details(attrs={})
    fill_in "membership_registration_form[full_name]",    with: attrs[:full_name]
    fill_in "membership_registration_form[email]",        with: attrs[:email]
    fill_in "membership_registration_form[password]",     with: attrs[:password]
    fill_in "membership_registration_form[phone_number]", with: attrs[:phone_number]
  end

  def submit_registration
    click_button "Pay & Register"
  end

  private

  def enter_payment_details(details={})
    next_month = Time.now.next_month
    find_stripe_field("number").set(details.fetch(:card))
    page.select next_month.strftime("%m"), from: "exp_month"
    page.select next_month.year, from: "exp_year"
    find_stripe_field("cvc").
      set(details.fetch(:cvc, 123))
  end

  def find_stripe_field(name)
    find(:xpath, "//input[@data-stripe='#{name}']")
  end

end
