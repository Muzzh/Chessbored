require 'rails_helper'

RSpec.feature "Games", type: :feature do
  scenario "user joins random game" do
    game = FactoryGirl.create(:pending_game)
    user = FactoryGirl.create(:user)

    visit root_path
    within ".login" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end
    click_button "Join a Random Game"
    game.reload
    expect(game.black_player_id).to eq(user.id)
  end
end
