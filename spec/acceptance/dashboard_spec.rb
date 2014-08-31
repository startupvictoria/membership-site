require 'acceptance_spec_helper'

def create_user_customer_membership
  u = create_user
  c = Customer.create!  user: u
  m = Membership.create! customer: c, plan_id: "premium"
end

def create_user
  User.create!(
    password: "att1cus",
    email: "atticus@gmail.com",
    full_name: "atty"
  )
end

def log_in
  log_in_page = LogInPage.new(self)
  log_in_page.visit

  log_in_page.enter_email("atticus@gmail.com")
  log_in_page.enter_password("att1cus")
  log_in_page.submit
end

feature "Dashboard" do
  feature "Receipts" do
    context "when the user has made no payments" do
      before(:all) do
        create_user
      end

      it "shows 'you have no payments'" do
        log_in

        page.click_on "Receipts"

        expect(page).to have_content("You have not made any payments")
      end
    end
  end

  context "when the user has made a payment" do
    before(:all) do
      create_user_customer_membership
    end

    it "the Download link shows a pdf" do
      log_in

      page.click_on "Receipts"

      page.click_on "Download"

      expect(page.response_headers['Content-Type']).to include "application/pdf"
    end
  end
end
