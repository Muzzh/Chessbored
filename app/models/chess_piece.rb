class ChessPiece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  # this will be called inside valid_move? method
  def obstructed?(x_target, y_target)
    # determine direction
    direction = move_direction(x_target, y_target)
    if direction == 'horizontal'
      if x_target > x
        # right
        (x + 1).upto(x_target - 1) do |x_current|
          return true if occupied?(x_current, y)
        end
      else
        # left
        (x - 1).downto(x_target + 1) do |x_current|
          return true if occupied?(x_current, y)
        end
      end
    elsif direction == 'vertical'
      if y_target > y
        # up
        (y + 1).upto(y_target - 1) do |y_current|
          return true if occupied?(x, y_current)
        end
      else
        # down
        (y - 1).downto(y_target + 1) do |y_current|
          return true if occupied?(x, y_current)
        end
      end
    elsif direction == 'diagonal'
      # up and right
      if x_target > x && y_target > y
        (x + 1).upto(x_target - 1) do |x_current|
          y_current = y + (x_current - x)
          return true if occupied?(x_current, y_current)
        end

      # up and left
      elsif x_target < x && y_target > y
        (x - 1).downto(x_target + 1) do |x_current|
          y_current = y + (x_current - x).abs
          return true if occupied?(x_current, y_current)
        end
      # down and right
      elsif x_target > x && y_target < y
        (x + 1).upto(x_target - 1) do |x_current|
          y_current = y - (x_current - x)
          return true if occupied?(x_current, y_current)
        end
      # down and left
      else
        (x - 1).downto(x_target + 1) do |x_current|
          y_current = y - (x_current - x).abs
          return true if occupied?(x_current, y_current)
        end
      end
    end
    false
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


