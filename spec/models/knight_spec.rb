require 'rails_helper'

RSpec.describe Knight, type: :class do

  describe '.valid_move?' do
    it "should check for valid move for a Knight" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:knight, user_id: user.id)
      piece.x = 2; piece.y = 5; piece.color = "white";
      # valid move
      expect(piece.valid_move?(piece.x+2, piece.y+1)).to eq(true) 
      expect(piece.valid_move?(piece.x+2, piece.y-1)).to eq(true)
      expect(piece.valid_move?(piece.x-2, piece.y+1)).to eq(true) 
      expect(piece.valid_move?(piece.x-2, piece.y-1)).to eq(true)
      expect(piece.valid_move?(piece.x+1, piece.y+2)).to eq(true)
      expect(piece.valid_move?(piece.x+1, piece.y-2)).to eq(true)
      expect(piece.valid_move?(piece.x-1, piece.y+2)).to eq(true)
      expect(piece.valid_move?(piece.x-1, piece.y-2)).to eq(true)
    end
    it "should check for invalid move for a Knight" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:knight, user_id: user.id)
      piece.x = 2; piece.y = 5; piece.color = "white";
      expect(piece.valid_move?(piece.x+0, piece.y+0)).to eq(false)
      expect(piece.valid_move?(piece.x-2, piece.y-2)).to eq(false)
      expect(piece.valid_move?(piece.x+1, piece.y+3)).to eq(false)
      expect(piece.valid_move?(piece.x+8, piece.y+0)).to eq(false)
    end
  end

  describe '.obstructed?' do
    it 'should always return false on a knight move' do
      user = FactoryGirl.create(:user)
      knight = FactoryGirl.create(:knight, user_id: user.id, x: 3, y: 3)
      piece = FactoryGirl.create(:pawn, user_id: user.id)
      expect(piece.obstructed?(5, 5)).to eq(false)
    end
  end
end