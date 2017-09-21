class ChessPiece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  # Common methods for all pieces ...
end
