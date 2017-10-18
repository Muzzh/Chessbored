# Pawn specific methods ...
class Pawn < ChessPiece
  def valid_move?(x_target, y_target)
    return false unless super
    return true if color == 'white' && y == 1 && x == x_target && y_target == 3 # 1st move
    return true if color == 'black' && y == 6 && x == x_target && y_target == 4 # 1st move
    return true if color == 'white' && move_single_step?(x_target, y_target) && y_target > y
    return true if color == 'black' && move_single_step?(x_target, y_target) && y_target < y
    #return true for en passant for white to capture black
    #return true if color == 'white' && 
    #return true for en passant for black to capture white
    #return true if color == 'black' &&
    false
  end

  def white_pawn_just_moved_two?(x_target, y_target)
    return true if valid_move?(x_target, y_target) && color == 'white' && y == 1 && x == x_target && y_target == 3
    false
  end

  def black_pawn_just_moved_two?(x_target, y_target)
    return true if valid_move?(x_target, y_target) && color == 'black' && y == 6 && x == x_target && y_target == 4
    false
  end
end
