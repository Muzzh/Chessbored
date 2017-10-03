class ChessPiece < ApplicationRecord
  belongs_to :game
  belongs_to :user



  def is_obstructed?(x_target, y_target)
    # determine direction
    
    if move_direction(x_target, y_target) == 'horizontal'
      if x_target > x
        (x + 1).upto(x_target -1) do |x_current|
          return true if occupied?(x_current, y)
        end
      else
        (x - 1).downto(x_target + 1) do |x_current|
          return true if occupied?(x_current, y)
        end
      end
    elsif move_direction(x_target, y_target) == 'vertical'
      if y_target > y
        (y + 1).upto(y_target -1) do |y_current|
          return true if occupied?(x, y_current)
        end
      else
        (y - 1).downto(y_target + 1) do |y_current|
          return true if occupied?(x, y_current)
        end
      end
    elsif move_direction(x_target, y_target) == 'diagonal'
      # up and right
      if x_target > x && y_target > y
      
      # up and left
      elsif x_target < x && y_target > y
        
      # down and right
      elsif x_target > x && y_target < y
        
      # down and left
      else
      
      end
    end
    return false
    # determine each spot between start and target
    # check presence of a piece at each spot
  end

  def move_direction(x_target, y_target)
    return 'horizontal' if x != x_target && y == y_target
    return 'vertical' if x == x_target && y != y_target
    return 'diagonal' if (x_target - x).abs == (y_target - y).abs
    false
  end

  def occupied?(x_current, y_current)
    game.chess_pieces.where(x: x_current, y: y_current).present?
  end
  # Common methods for all pieces ...
end


