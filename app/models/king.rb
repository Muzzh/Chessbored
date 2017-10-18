# King specific methods
class King < ChessPiece
  def valid_move?(x_target, y_target)
    return false unless super
    move_single_step?(x_target, y_target)
  end
end
