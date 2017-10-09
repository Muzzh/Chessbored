class King < ChessPiece
  
  # King specific methods ...
  def valid_move?(x_target, y_target)
    return false if !super
    return true if move_single_step?(x_target, y_target)
    return false
  end

end