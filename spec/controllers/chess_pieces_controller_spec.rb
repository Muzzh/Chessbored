require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
  describe 'chess_pieces#create' do
    it 'should create dummy King' do
      user = FactoryGirl.create(:user)
      king = FactoryGirl.create(:king, user_id: user.id)
      expect(king.user_id).to eq(user.id)
      expect(king.x).to eq(3)
      expect(king.y).to eq(0)
      expect(king.captured).to eq(false)
      expect(king.type).to eq('King')
    end
  end

  describe 'chess_pieces#update' do

    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    it 'should change pawn location on VALID move' do
      game  = FactoryGirl.create(:game, white_player_id: user1, black_player_id: user2)
      piece = FactoryGirl.create(:pawn, user_id: user1.id, game_id: game.id, x: 0, y: 1)
      king  = FactoryGirl.create(:king, color: 'white', x: 3, y: 1, user_id: user1.id, game_id: game.id, )
      king2 = FactoryGirl.create(:king, color: 'black', x: 3, y: 7, user_id: user1.id, game_id: game.id, )
      put :update, params: { id: piece.id, x_target: 0, y_target: 2 } # pawn 0, 1 => 0, 2
      piece.reload
      expect(piece.x).to eq(0)
      expect(piece.y).to eq(2)
    end

    it 'should NOT change pawn location on INVALID move' do
      game = FactoryGirl.create(:game, white_player_id: user1, black_player_id: user2)
      piece = FactoryGirl.create(:pawn, user_id: user1.id, game_id: game.id, x: 0, y: 1)
      put :update, params: { id: piece.id, x_target: 1, y_target: 3 } # pawn 0, 1 => 1, 3
      piece.reload
      expect(piece.x).to eq(0)
      expect(piece.y).to eq(1)
    end

    it 'should indicate check condition with the move' do
      game = FactoryGirl.create(:game, white_player_id: user1, black_player_id: user2)
      king2   = FactoryGirl.create(
          :king,  user_id: user2.id, color: 'black', game_id: game.id, x: 6,y: 6) # king2  6, 6
      king1   = FactoryGirl.create(
          :king,  user_id: user1.id, color: 'white', game_id: game.id, x: 7,y: 1)
      queen1  = FactoryGirl.create(
          :queen, user_id: user1.id, color: 'white', game_id: game.id, x: 1,y: 1) # queen1 1, 1
      put :update, params: { id: queen1.id, x_target: 6, y_target: 1 }            # queen1 1,1 => 6,1
      game.reload
      expect(game.status).to eq("in_check")
    end

    it 'should prevent illegal move' do
      game = FactoryGirl.create(:game, white_player_id: user1, black_player_id: user2)
      queen1  = FactoryGirl.create(
          :queen, user_id: user1.id, color: 'white', game_id: game.id, x: 5,y: 1) # queen1  5, 1
      king2   = FactoryGirl.create(
          :king,  user_id: user2.id, color: 'black', game_id: game.id, x: 6,y: 6) # king2   6, 6
      put :update, params: { id: king2.id, x_target: 5, y_target: 6 }             # king2   6,6 => 5,6
      game.reload
      expect(king2.x).to eq(6)
    end

  end

end
