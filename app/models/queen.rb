class Queen < ChessPiece

  # Queen specific methods ...

  def valid_move?(x_target, y_target)
    return false if !super
    # return false if is_obstructed?(x_target, y_target)
    return true if move_straight_line?(x_target, y_target)
    return true if move_diagonally?(x_target, y_target)
    return false
  end

end