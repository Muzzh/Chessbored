class ChessPiece < ApplicationRecord
  # Will have to add belongs_to :game, :user_id
  self.inheritance_column = :type

  def self.types
    %w(Rook Knight Bishop King Queen Pawn)
  end

  def self.chess_piece
    %w(Rook Knight Bishop King Queen Pawn)
  end

  # Common methods for all pieces ...
  def valid_move?(x_target, y_target)
  end

  private

  def same_location?(x_target, y_target)
    return x == x_target && y == y_target
  end

  def in_board?(x_target, y_target)
    return x_target >= 0 && x_target <=7 && y_target >= 0 && y_target <=7
  end

end
