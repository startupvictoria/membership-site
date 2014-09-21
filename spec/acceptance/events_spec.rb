require 'acceptance_spec_helper'

feature "the events page" do
  before(:each) do
    create(:event, starts_at: 1.month.ago,       title: "title-1.month.ago")
    create(:event, starts_at: Time.now,          title: "title-now")
    create(:event, starts_at: 1.month.from_now,  title: "title-1.month.from_now")

    visit "/events"
  end

  it "shows upcoming events" do
    expect(page).to have_content("title-1.month.from_now")

    expect(page).not_to have_content("title-now")
    expect(page).not_to have_content("title-1.month.ago")
  end

  context "the Previous tab" do
    it "shows previous events" do
      click_on "Previous"

      expect(page).to have_content("title-1.month.ago")
      expect(page).to have_content("title-now")

      expect(page).not_to have_content("title-1.month.from_now")
    end
  end
end
