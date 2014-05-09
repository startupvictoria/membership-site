require 'acceptance_spec_helper'

feature "the homepage" do
  it "can be viewed" do
    visit "/"

    expect(page).to have_content("Startup Victoria")
  end
end
