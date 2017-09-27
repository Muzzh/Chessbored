require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#new action" do
    it "should require user to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form to a logged in user" do
      user = FactoryGirl.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'game#index action' do

    it 'should require a user to be logged in to display opened games' do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    it 'should successfully display "pending" games' do
      user = FactoryGirl.create(:user)
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'game#show action' do

    it 'should require a user to be logged in to display a game' do
      game = FactoryGirl.create(:game)
      get :show, params: { id: game.id }
      expect(response).to redirect_to new_user_session_path
    end

    it 'should allow a user to see a game' do
      user = FactoryGirl.create(:user)
      sign_in user
      game = FactoryGirl.create(:game)
      get :show, params: { id: game.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#update action" do
    it "should allow user to join a game as the black player" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      sign_in user1
      sign_in user2
      game = FactoryGirl.create(:game, :pending, white_player_id: user1.id)
      patch :update, params: { id: game.id, current_user: user2}
      expect(game.black_player_id).to eq(user2.id)
    end
  end
end
