class ChessPiece < ApplicationRecord
  belongs_to :game
  belongs_to :user


  private

  def is_occupied?(x_current, y_current)
    game.pieces.where(x: x_current, y: y_current).present?
  end

  def is_obstructed?(x_target, y_target)
    if move_diagonally?

    end
  end

  def horizontal?
    
  end

  def move_diagonally?(x_target, y_target)
    x_dist = (x_target - x).abs
    y_dist = (y_target - y).abs
    return true if x_dist == y_dist
    return false
  end

  def vertical?
    
  end
  # Common methods for all pieces ...
end


