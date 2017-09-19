require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "user signs in and out" do
    user = FactoryGirl.create(:user)

    visit root_path
    within ".login" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    expect(page).to have_content "Signed in successfully."
    click_on "Sign Out"
    expect(page).to have_content "Signed out successfully."
  end
end
