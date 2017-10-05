class ChessPiece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  # this will be called inside valid_move? method
  def obstructed?(x_target, y_target)
    case 
      when horizontal_move?(x_target, y_target)
        horizontal_obstruction?(x_target, y_target)
      when vertical_move?(x_target, y_target)
        vertical_obstruction?(x_target, y_target)
      when diagonal_move?(x_target, y_target)
        diagonal_obstruction?(x_target, y_target)
      else
        false
    end
  end

  def up_horizontal_obstruction?(x_target, y_target)
    ary = (x + 1).step(x_target - 1, 1)
    ary.each do |x_current|
      return true if occupied?(x_current, y)
    end
  end

  def down_horizontal_obstruction?(x_target, y_target)
    ary = (x - 1).step(x_target + 1, -1)
    ary.each do |x_current|
      return true if occupied?(x_current, y)
    end
  end

  def horizontal_obstruction?(x_target, y_target)
    # range = Range.new(x_target, y_target)
    direction = x_target > x ? 1 : -1

    if x_target > x
      up_horizontal_obstruction?(x_target, y_target)
    else
      down_horizontal_obstruction?(x_target, y_target)
    end
  end

  def vertical_obstruction?(x_target, y_target)
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
  end

  def diagonal_obstruction?(x_target, y_target)
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

  def horizontal_move?(x_target, y_target)
    x != x_target && y == y_target
  end

  def vertical_move?(x_target, y_target)
    x == x_target && y != y_target
  end

  def diagonal_move?(x_target, y_target)
    (x_target - x).abs == (y_target - y).abs
  end

  def occupied?(x_current, y_current)
    game.chess_pieces.where(x: x_current, y: y_current).present?
  end

  # Common methods for all pieces ...
end


