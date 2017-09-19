class ChessPiece < ApplicationRecord
  # Will have to add belongs_to :game, :user

  MIN_INDEX = 0
  MAX_INDEX = 7

  # Common methods for all pieces ...
  def valid_move?(x_target, y_target)
  end

  private

  def same_location?(x_target, y_target)
    return x == x_target && y == y_target
  end

  def in_board?(x_target, y_target)
    return x_target >= MIN_INDEX && x_target <= MAX_INDEX && 
           y_target >= MIN_INDEX && y_target <= MAX_INDEX
  end

end
