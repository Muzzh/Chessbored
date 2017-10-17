# Queen specific methods ...
class Queen < ChessPiece
  def valid_move?(x_target, y_target)
    return false unless super
    return true if horizontal_move?(x_target, y_target) ||
                   vertical_move?(x_target, y_target) ||
                   diagonal_move?(x_target, y_target)
    false
  end
end
