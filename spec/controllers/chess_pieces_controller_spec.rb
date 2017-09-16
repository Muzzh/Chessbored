require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
  
  describe 'chess_pieces#create' do
    it "should create dummy King" do
      king = FactoryGirl.create(:king)
      expect(king.game_id).to eq(1)
      expect(king.user_id).to eq(1)
      expect(king.x).to eq(1)
      expect(king.y).to eq(2)
      expect(king.captured).to eq(false)
      expect(king.type).to eq('King')
    end
    it "should allow creating a King" do
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: 1, y: 2, captured: false, type: 'King' } }
      expect(King.last.user_id).to eq(1)
      expect(King.last.x).to eq(1)
      expect(King.last.y).to eq(2)
      expect(King.last.captured).to eq(false)
      expect(ChessPiece.last.type).to eq('King')
    end
    it "should check for a valid move for a King" do
      post :create, params: { chess_piece: { user_id: 1, game_id: 1, x: 0, y: 0, captured: false, type: 'King' } }
      king = King.last
      expect(king.valid_move?(0,1)).to eq(true)
      expect(king.valid_move?(1,0)).to eq(true)
      expect(king.valid_move?(1,1)).to eq(false)
      expect(king.valid_move?(2,2)).to eq(false)
      expect(king.valid_move?(-1,0)).to eq(false)
    end
  end

end