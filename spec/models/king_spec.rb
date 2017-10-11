require 'rails_helper'

RSpec.describe King, type: :class do

  describe '.valid_move?' do
    it "should check for valid move for a King" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:king, user_id: user.id)
      piece.x = 4; piece.y = 4; piece.color = "white"
      expect(piece.valid_move?(piece.x+1, piece.y+0)).to eq(true)
      expect(piece.valid_move?(piece.x-1, piece.y+0)).to eq(true)
      expect(piece.valid_move?(piece.x+0, piece.y+1)).to eq(true)
      expect(piece.valid_move?(piece.x+0, piece.y-1)).to eq(true)
    end

    it "should check for invalid move for a King" do
      user = FactoryGirl.create(:user)
      piece = FactoryGirl.create(:king, user_id: user.id)
      piece.x = 4; piece.y = 4; piece.color = "white"
      expect(piece.valid_move?(piece.x+0, piece.y+0)).to eq(false)
      expect(piece.valid_move?(piece.x+2, piece.y+0)).to eq(false)
      expect(piece.valid_move?(piece.x-3, piece.y+0)).to eq(false)
      expect(piece.valid_move?(piece.x+0, piece.y+2)).to eq(false)
      expect(piece.valid_move?(piece.x+0, piece.y-3)).to eq(false)
      expect(piece.valid_move?(piece.x+2, piece.y-3)).to eq(false)
    end
  end

  describe '.moved?' do
    it "should check if the piece has moved" do
      user = FactoryGirl.create(:user)
      king = FactoryGirl.create(:king, user_id: user.id)

      expect(king.moved?).to eq(false)
    end
  end

end
