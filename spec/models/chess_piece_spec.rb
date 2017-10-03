require 'rails_helper'

RSpec.describe ChessPiece, type: :model do
  it_behaves_like "an STI class"

  describe '.is_obstructed?' do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }
    let(:game) { FactoryGirl.create(:game) }

    # Horizontal
    it 'should return true - Horizontal Right YES obstruction' do
      rook = FactoryGirl.create(:rook, x: 4, y: 4, user_id: user1.id, game_id: game.id)
      knight = FactoryGirl.create(:bishop, x: 6, y: 4, user_id: user1.id, game_id: game.id)
      # start 4, 4 => 7, 4 -- piece at 6, 4 
      expect(rook.is_obstructed?(7, 4)).to eq(true)
    end

    it 'should return false - Horizontal Right NO obstruction' do
      rook = FactoryGirl.create(:rook, x: 4, y: 4, user_id: user1.id, game_id: game.id)
      # start 4, 4 => 7, 4
      expect(rook.is_obstructed?(7, 4)).to eq(false)
    end

    it 'should return true - Horizontal Left YES obstruction' do
      rook = FactoryGirl.create(:rook, x: 4, y: 4, user_id: user1.id, game_id: game.id)
      knight = FactoryGirl.create(:bishop, x: 3, y: 4, user_id: user1.id, game_id: game.id)
      # start 4, 4 => 2, 4 -- piece at 3, 4
      expect(rook.is_obstructed?(2, 4)).to eq(true)
    end

    it 'should return false - Horizontal Left NO obstruction' do
      rook = FactoryGirl.create(:rook, x: 4, y: 4, user_id: user1.id, game_id: game.id)
      # start 4, 4 => 2, 4
      expect(rook.is_obstructed?(2, 4)).to eq(false)
    end

    # Vertical
    it 'should return true - Horizontal Up YES obstruction' do
      rook = FactoryGirl.create(:rook, x: 2, y: 2, user_id: user1.id, game_id: game.id)
      knight = FactoryGirl.create(:bishop, x: 2, y: 4, user_id: user1.id, game_id: game.id)
      # start 2, 2 => 2, 5 -- piece at 2, 4
      expect(rook.is_obstructed?(2, 5)).to eq(true)
    end

    it 'should return false - Horizontal Up NO obstruction' do
      rook = FactoryGirl.create(:rook, x: 2, y: 2, user_id: user1.id, game_id: game.id)
      # start 2, 2 => 2, 5
      expect(rook.is_obstructed?(2, 5)).to eq(false)
    end

    it 'should return true - Horizontal Down YES obstruction' do
      rook = FactoryGirl.create(:rook, x: 2, y: 5, user_id: user1.id, game_id: game.id)
      knight = FactoryGirl.create(:bishop, x: 2, y: 4, user_id: user1.id, game_id: game.id)
      # start 2, 5 => 2, 2 piece at 2, 4
      expect(rook.is_obstructed?(2, 2)).to eq(true)
    end

    it 'should return false - Horizontal Down NO obstruction' do
      rook = FactoryGirl.create(:rook, x: 2, y: 5, user_id: user1.id, game_id: game.id)
      # start 2, 5 => 2, 2
      expect(rook.is_obstructed?(2, 2)).to eq(false)
    end

    it 'should return true - Diagonal Up Right YES obstruction' do

    end

    it 'should return false - Diagonal Up Right NO obstruction' do

    end

    it 'should return true - Diagonal Up Left YES obstruction' do

    end

    it 'should return false - Diagonal Up Left NO obstruction' do

    end

    it 'should return true - Diagonal Down Right YES obstruction' do

    end

    it 'should return false - Diagonal Down Right NO obstruction' do

    end

    it 'should return true - Diagonal Down Left YES obstruction' do

    end

    it 'should return false - Diagonal Down Left NO obstruction' do

    end
  end
end
