class ChessPiece < ApplicationRecord
  belongs_to :game

  self.inheritance_column = :type
  # Common methods for all pieces ...
end
