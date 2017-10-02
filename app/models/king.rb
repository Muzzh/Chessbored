class King < ChessPiece
  
  # King specific methods ...
  def valid_move?(x_target, y_target)
    return false if same_location?(x_target, y_target)
    return false if !in_board?(x_target, y_target)
    return move_straight_line?(x_target, y_target, single_step=true)
    return false
  end

end