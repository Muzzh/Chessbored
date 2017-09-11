require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
  describe 'chess_pieces#create' do
    it "should allow creating a King" do
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: 1, y: 2, captured: false, type: 'King' } }
      expect(King.last.user_id).to eq(1)
      expect(King.last.x).to eq(1)
      expect(King.last.y).to eq(2)
      expect(King.last.captured).to eq(false)
      expect(ChessPiece.last.type).to eq('King')
    end
  end
end
