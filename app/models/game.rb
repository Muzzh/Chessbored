class Game < ApplicationRecord
  scope :by_status, ->(status) { where(status: status) }
  scope :pending, -> { by_status('pending') }
  scope :completed, -> { by_status('completed') }
  scope :in_progress, -> { by_status('in_progress') }
  scope :recent, -> { order('games.updated_at DESC') }

  def pending?
    status == 'pending'
  end

  def populate_pieces
    #White Game Pieces
    (0..7).each do |i|
      Pawn.create (
        game_id: id,
        x_position: i,
        y_position: 1,
        color: white,
        )
    end

    Rook.create (game_id: id, x_position: 0, y_position: 0, color: white)
    Rook.create (game_id: id, x_position: 7, y_position: 0, color: white)

    Knight.create (game_id: id, x_position: 1, y_position: 0, color: white)
    Knight.create (game_id: id, x_position: 6, y_position: 0, color: white)

    Bishop.create (game_id: id, x_position: 2, y_position: 0, color: white)
    Bishop.create (game_id: id, x_position: 5, y_position: 0, color: white)

    Queen.create (game_id: id, x_position: 3, y_position: 0, color: white)

    King.create (game_id: id, x_position: 4, y_position: 0, color: white)

    #Black Game Pieces

    (0..7).each do |i|
      Pawn.create (
        game_id: id,
        x_position: i,
        y_position: 6,
        color: black,
        )
    end

    Rook.create (game_id: id, x_position: 0, y_position: 7, color: black)
    Rook.create (game_id: id, x_position: 7, y_position: 7, color: black)

    Knight.create (game_id: id, x_position: 1, y_position: 7, color: black)
    Knight.create (game_id: id, x_position: 6, y_position: 7, color: black)

    Bishop.create (game_id: id, x_position: 2, y_position: 7, color: black)
    Bishop.create (game_id: id, x_position: 5, y_position: 7, color: black)

    Queen.create (game_id: id, x_position: 3, y_position: 7, color: black)

    King.create (game_id: id, x_position: 4, y_position: 7, color: black)
  end
end
