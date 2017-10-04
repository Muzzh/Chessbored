require 'rails_helper'

RSpec.describe Rook, type: :class do
  describe '.valid_move?' do
    it "should check for valid move for a Rook" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:rook, user_id: user.id)
      piece.x = 3; piece.y = 3; piece.color = "white";
      expect(piece.valid_move?(piece.x+0, piece.y+2)).to eq(true)
      expect(piece.valid_move?(piece.x+0, piece.y-2)).to eq(true)
      expect(piece.valid_move?(piece.x+3, piece.y+0)).to eq(true)
      expect(piece.valid_move?(piece.x-3, piece.y+0)).to eq(true)
      expect(piece.valid_move?(piece.x+1, piece.y+0)).to eq(true)
      expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true)
    end
    it "should check for invalid move for a Rook" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:rook, user_id: user.id)
      piece.x = 3; piece.y = 3; piece.color = "white";
      expect(piece.valid_move?(piece.x+0, piece.y+0)).to eq(false)
      expect(piece.valid_move?(piece.x+2, piece.y+3)).to eq(false)
      expect(piece.valid_move?(piece.x-3, piece.y+4)).to eq(false)
      expect(piece.valid_move?(piece.x+0, piece.y+8)).to eq(false)
      expect(piece.valid_move?(piece.x-5, piece.y+0)).to eq(false)
    end
  end
end