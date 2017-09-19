class ChessPiece < ApplicationRecord

  belongs_to :game #optional: true

  # Common methods for all pieces ...
end
