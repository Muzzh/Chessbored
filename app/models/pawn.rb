# Pawn specific methods ...
class Pawn < ChessPiece
  def valid_move?(x_target, y_target)
    return false unless super
    return true if color == 'white' && y == 1 && x == x_target && y_target == 3 # 1st move
    return true if color == 'black' && y == 6 && x == x_target && y_target == 4 # 1st move
    return true if color == 'white' && move_single_step?(x_target, y_target) && y_target > y
    return true if color == 'black' && move_single_step?(x_target, y_target) && y_target < y
    false
  end
end
