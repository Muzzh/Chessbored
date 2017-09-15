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
end
