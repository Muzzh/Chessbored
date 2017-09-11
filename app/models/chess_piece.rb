class ChessPiece < ApplicationRecord
  # Will have to add belongs_to :game, :user_id
  self.inheritance_column = :type

  def self.types
    %w(Rook Knight Bishop King Queen Pawn)
  end

  # Common methods for all pieces ...
end
