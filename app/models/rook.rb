class Rook < ChessPiece

  # Rook specific methods ...

  def valid_move?(x_target, y_target)
    return false if !super
    # return false if is_obstructed?(x_target, y_target)
    return move_straight_line?(x_target, y_target, single_step=false)
    return false
  end

end