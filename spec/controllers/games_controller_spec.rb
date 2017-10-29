require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'games#new action' do
    it 'should require user to be logged in' do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it 'should successfully show the new form to a logged in user' do
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

    it 'should direct to piece url on link request' do
      user = FactoryGirl.create(:user)
      game = FactoryGirl.create(:game)
      piece = FactoryGirl.create(:king, user_id: user.id, game_id: game.id)
      get :show, params: { id: game.id, chess_piece_id: piece.id }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'games#update action' do
    it 'should allow user to join a game as the black player and assign the first turn' do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)

      sign_in user1
      sign_in user2

      game = FactoryGirl.create(:game, :pending, white_player_id: user1.id)
      put :update, params: { id: game.id, current_user: user2.id }
      game.reload
      expect(game.status).to eq('in_progress')
      expect(game.black_player_id).to eq(user2.id)
      expect(game.turn).to eq('white')
    end

    it 'should not allow user to join a game they created' do
      user = FactoryGirl.create(:user)
      sign_in user

      game = FactoryGirl.create(:game, :pending, white_player_id: user.id)
      put :update, params: { id: game.id, current_user: user.id }
      expect(game.status).to eq('pending')
      expect(response).to redirect_to game_path(game)
    end
  end

  describe 'games#offer_draw' do
    let(:game) { FactoryGirl.create :game }
      it 'should successfully show the page that prompts opponent if a player proposes a draw' do
        user = FactoryGirl.create(:user)
        sign_in user
        game = FactoryGirl.create(:game, :in_progress, white_player_id: user.id)
        put :update, params: { id: game.id, current_user: user.id }
        expect(response).to have_http_status(:success)
      end

      it 'prompts the black player if white player proposes a draw' do
        game.offer_draw(game.white_player_id)
        
        expect(response).to redirect_to game_offer_draw_path(game)
      end

      it 'prompts the white player if black player proposes a draw' do
        game.offer_draw(game.black_player_id)
        post :offer_draw
        expect(response).to have_http_status(:success)
      end

      it 'raises an error if an invalid user_id is provided' do
        expect{game.offer_draw(0)}.to raise_error("Player does not exist.")
      end
  end
end
