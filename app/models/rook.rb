# Rook specific methods ...
class Rook < ChessPiece
  def valid_move?(x_target, y_target)
    return false unless super
    vertical_move?(x_target, y_target) || horizontal_move?(x_target, y_target)
  end
end
