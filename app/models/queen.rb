class Queen < ChessPiece

  # Queen specific methods ...

  def valid_move?(x_target, y_target)
    return false if !super
    return true if horizontal_move?(x_target, y_target) || vertical_move?(x_target, y_target) || diagonal_move?(x_target, y_target)
    return false
  end

end