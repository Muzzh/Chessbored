require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '.pending' do
    let(:game) { FactoryGirl.create :game, :pending }

    it 'is pending' do
      expect(game.status).to eq 'pending'
    end

    it 'is not completed' do
      expect(game.pending?).to eq true
    end
  end

  describe '.completed' do
    let(:game) { FactoryGirl.create :game, :completed }

    it 'is completed' do
      expect(game.status).to eq 'completed'
    end

    it 'is not pending' do
      expect(game.pending?).to eq false
    end
  end

  describe '.in_progress' do
    let(:game) { FactoryGirl.create :game, :in_progress }

    it 'is completed' do
      expect(game.status).to eq 'in_progress'
    end

    it 'is not pending' do
      expect(game.pending?).to eq false
    end
  end

  describe '#populate_pieces' do
    let(:game) { FactoryGirl.create :game }

    it 'adds a white pawn at x_position: 0 through 7, y_position: 1' do
      expect(Pawn.where(game_id: game.id, x: (0..7), y: 1, user_id: game.white_player_id).first).not_to be_nil
    end

    it 'adds a black pawn at x_position: 0 through 7, y_position: 6' do
      expect(Pawn.where(game_id: game.id, x: (0..7), y: 6, user_id: game.black_player_id).first).not_to be_nil
    end
  end

  describe '#populate_pieces' do
    let(:game) { FactoryGirl.create :game }

    it 'adds a white rook at x_position: 0 and 7, y_position: 0' do
      expect(Rook.where(game_id: game.id, x: 0, y: 0, user_id: game.white_player_id).first).not_to be_nil
      expect(Rook.where(game_id: game.id, x: 7, y: 0, user_id: game.white_player_id).first).not_to be_nil
    end

    it 'adds a black rook at x_position: 0 and 7, y_position: 7' do
      expect(Rook.where(game_id: game.id, x: 0, y: 7, user_id: game.black_player_id).first).not_to be_nil
      expect(Rook.where(game_id: game.id, x: 7, y: 7, user_id: game.black_player_id).first).not_to be_nil
    end
  end

  describe '#populate_pieces' do
    let(:game) { FactoryGirl.create :game }

    it 'adds a white knight at x_position: 1 and 6, y_position: 0' do
      expect(Knight.where(game_id: game.id, x: 1, y: 0, user_id: game.white_player_id).first).not_to be_nil
      expect(Knight.where(game_id: game.id, x: 6, y: 0, user_id: game.white_player_id).first).not_to be_nil
    end

    it 'adds a black knight at x_position: 1 and 6, y_position: 7' do
      expect(Knight.where(game_id: game.id, x: 1, y: 7, user_id: game.black_player_id).first).not_to be_nil
      expect(Knight.where(game_id: game.id, x: 6, y: 7, user_id: game.black_player_id).first).not_to be_nil
    end
  end

  describe '#populate_pieces' do
    let(:game) { FactoryGirl.create :game }

    it 'adds a white bishop at x_position: 2 and 5, y_position: 0' do
      expect(Bishop.where(game_id: game.id, x: 2, y: 0, user_id: game.white_player_id).first).not_to be_nil
      expect(Bishop.where(game_id: game.id, x: 5, y: 0, user_id: game.white_player_id).first).not_to be_nil
    end

    it 'adds a black bishop at x_position: 2 and 5, y_position: 0' do
      expect(Bishop.where(game_id: game.id, x: 2, y: 7, user_id: game.black_player_id).first).not_to be_nil
      expect(Bishop.where(game_id: game.id, x: 5, y: 7, user_id: game.black_player_id).first).not_to be_nil
    end
  end

  describe '#populate_pieces' do
    let(:game) { FactoryGirl.create :game }

    it 'adds a white queen at x_position: 3, y_position: 0' do
      expect(Queen.where(game_id: game.id, x: 3, y: 0, user_id: game.white_player_id).first).not_to be_nil
    end

    it 'adds a black queen at x_position: 3, y_position: 7' do
      expect(Queen.where(game_id: game.id, x: 3, y: 7, user_id: game.black_player_id).first).not_to be_nil
    end
  end

  describe '#populate_pieces' do
    let(:game) { FactoryGirl.create :game }

    it 'adds a white king at x_position: 4, y_position: 0' do
      expect(King.where(game_id: game.id, x: 4, y: 0, user_id: game.white_player_id).first).not_to be_nil
    end

    it 'adds a black king at x_position: 4, y_position: 7' do
      expect(King.where(game_id: game.id, x: 4, y: 7, user_id: game.black_player_id).first).not_to be_nil
    end
  end
end
