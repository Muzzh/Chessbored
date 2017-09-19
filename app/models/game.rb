class Game < ApplicationRecord
  scope :by_status, ->(status) { where(status: status) }
  scope :pending, -> { by_status('pending') }
  scope :completed, -> { by_status('completed') }
  scope :in_progress, -> { by_status('in_progress') }
  scope :recent, -> { order('games.updated_at DESC') }

  after_create :populate_pieces

  def pending?
    status == 'pending'
  end

  def populate_pieces
    #"white" Game Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x: i,
        y: 1,
        user_id: white_player_id,
        )
    end

    Rook.create(game_id: id, x: 0, y: 0, user_id: white_player_id)
    Rook.create(game_id: id, x: 7, y: 0, user_id: white_player_id)

    Knight.create(game_id: id, x: 1, y: 0, user_id: white_player_id)
    Knight.create(game_id: id, x: 6, y: 0, user_id: white_player_id)

    Bishop.create(game_id: id, x: 2, y: 0, user_id: white_player_id)
    Bishop.create(game_id: id, x: 5, y: 0, user_id: white_player_id)

    Queen.create(game_id: id, x: 3, y: 0, user_id: white_player_id)

    King.create(game_id: id, x: 4, y: 0, user_id: white_player_id)

    #"black" Game Pieces

    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x: i,
        y: 6,
        user_id: black_player_id,
        )
    end

    Rook.create(game_id: id, x: 0, y: 7, user_id: black_player_id)
    Rook.create(game_id: id, x: 7, y: 7, user_id: black_player_id)

    Knight.create(game_id: id, x: 1, y: 7, user_id: black_player_id)
    Knight.create(game_id: id, x: 6, y: 7, user_id: black_player_id)

    Bishop.create(game_id: id, x: 2, y: 7, user_id: black_player_id)
    Bishop.create(game_id: id, x: 5, y: 7, user_id: black_player_id)

    Queen.create(game_id: id, x: 3, y: 7, user_id: black_player_id)

    King.create(game_id: id, x: 4, y: 7, user_id: black_player_id)
  end
end
