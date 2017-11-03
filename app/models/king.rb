# King specific methods
class King < ChessPiece
  def valid_move?(x_target, y_target)
    return false unless super
    move_single_step?(x_target, y_target)
  end

  def castling(x_target, y_target)
    # king has not moved

    # rook has not moved

    # not in check

    # no space that king moves through is in check

    # illegal_move
  end
end
