class Game < ApplicationRecord
  has_many :chess_pieces

  after_create :populate_white_pieces
  after_create :populate_black_pieces

  scope :by_status, ->(status) { where(status: status) }
  scope :pending, -> { by_status('pending') }
  scope :completed, -> { by_status('completed') }
  scope :in_progress, -> { by_status('in_progress') }
  scope :recent, -> { order('games.updated_at DESC') }


  def pending?
    status == 'pending'
  end




  def populate_white_pieces
    #"white" Game Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x: i,
        y: 1,
        user_id: white_player_id,
        color: "white",
        )
    end

    Rook.create(game_id: id, x: 0, y: 0, user_id: white_player_id, color: "white")
    Rook.create(game_id: id, x: 7, y: 0, user_id: white_player_id, color: "white")

    Knight.create(game_id: id, x: 1, y: 0, user_id: white_player_id, color: "white")
    Knight.create(game_id: id, x: 6, y: 0, user_id: white_player_id, color: "white")

    Bishop.create(game_id: id, x: 2, y: 0, user_id: white_player_id, color: "white")
    Bishop.create(game_id: id, x: 5, y: 0, user_id: white_player_id, color: "white")

    Queen.create(game_id: id, x: 3, y: 0, user_id: white_player_id, color: "white")

    King.create(game_id: id, x: 4, y: 0, user_id: white_player_id, color: "white")
  end

  def populate_black_pieces

    #"black" Game Pieces

    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x: i,
        y: 6,
        user_id: black_player_id,
        color: "black",
        )
    end

    Rook.create(game_id: id, x: 0, y: 7, user_id: black_player_id, color: "black")
    Rook.create(game_id: id, x: 7, y: 7, user_id: black_player_id, color: "black")

    Knight.create(game_id: id, x: 1, y: 7, user_id: black_player_id, color: "black")
    Knight.create(game_id: id, x: 6, y: 7, user_id: black_player_id, color: "black")

    Bishop.create(game_id: id, x: 2, y: 7, user_id: black_player_id, color: "black")
    Bishop.create(game_id: id, x: 5, y: 7, user_id: black_player_id, color: "black")

    Queen.create(game_id: id, x: 3, y: 7, user_id: black_player_id, color: "black")

    King.create(game_id: id, x: 4, y: 7, user_id: black_player_id, color: "black")
  end
end
