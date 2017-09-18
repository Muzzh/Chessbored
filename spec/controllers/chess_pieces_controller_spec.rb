require 'rails_helper'

RSpec.describe ChessPiecesController, type: :controller do
  
  describe 'chess_pieces#create' do
    it "should create dummy King" do
      king = FactoryGirl.create(:king)
      expect(king.game_id).to eq(1)
      expect(king.user_id).to eq(1)
      expect(king.x).to eq(3)
      expect(king.y).to eq(0)
      expect(king.captured).to eq(false)
      expect(king.type).to eq('King')
    end
  end

end