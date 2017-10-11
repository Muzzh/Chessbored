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
    let(:game) { FactoryGirl.create(:game, white_player_id: user1.id, turn: 'white') }
    let(:piece) { FactoryGirl.create(:pawn, user_id: user1.id, game_id: game.id, x: 0, y: 1) }

    it 'should change coordinates of the moved piece on VALID move' do
      put :update, params: { id: piece.id, x_target: 0, y_target: 2 }
      piece.reload
      expect(piece.x).to eq(0)
      expect(piece.y).to eq(2)
    end

    it 'should NOT change coordinates of the moved piece on INVALID move' do
      put :update, params: { id: piece.id, x_target: 1, y_target: 2 }
      piece.reload
      expect(piece.x).to eq(0)
      expect(piece.y).to eq(1)
    end

    it 'should swap the turn on valid move' do
      put :update, params: {id: piece.id, x_target: 1, y_target: 2 }
      game.reload
      expect(game.turn).to eq('black')
    end
  end
end
