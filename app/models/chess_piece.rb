class ChessPiece < ApplicationRecord
  belongs_to :game
  belongs_to :user


  def color
    user.id == game.white_player_id ? 'black' : 'white'
  end
  # Common methods for all pieces ...
end
