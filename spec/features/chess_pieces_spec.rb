require 'rails_helper'

RSpec.feature "ChessPieces", type: :feature do
  scenario "white pieces load on game create" do
    user = FactoryGirl.create(:user)

    visit root_path
    within ".login" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    click_link "Create"
    expect(page).to have_xpath("//img[contains(@src,'white')]")
  end
  scenario "black pieces load on game update" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:pending_game)

    visit root_path
    within ".login" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    click_button "Join Game"
    expect(page).to have_xpath("//img[contains(@src,'black')]")
  end
end
