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
    it 'should change coordinates of the moved piece' do
      user1 = FactoryGirl.create(:user)
      game = FactoryGirl.create(:game, white_player_id: user1.id)
      piece = FactoryGirl.create(:king, user_id: user1.id, game_id: game.id)
      put :update, params: { id: piece.id, x_target: 4, y_target: 4 }
      piece.reload
      expect(piece.x).to eq(4)
      expect(piece.y).to eq(4)
    end
  end
end
