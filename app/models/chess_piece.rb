class ChessPiece < ApplicationRecord
  # Will have to add belongs_to :game, :user

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
