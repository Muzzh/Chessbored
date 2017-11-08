# King specific methods
class King < ChessPiece
  def valid_move?(x_target, y_target)
    return false unless super
    # return true if castling?(x_target, y_target)
    move_single_step?(x_target, y_target)
  end

  def castling?(x_target, y_target)
    # king has not moved
    return false if moved_yet?
    # rook has not moved
    castled_rook = castling_rook(x_target, y_target)
    return false if castled_rook.moved_yet?
    # not in check
    if game.status == 'in_check'
      return false
    else
      return true
    end
    # no space that king moves through is in check

    # illegal_move

  end

  def castling_rook(x_target, y_target)
    king_target = [x_target, y_target]
    case king_target
      when [2, 0]
        return game.chess_pieces.where(x: 0, y: 0).first
      when [6, 0]
        return game.chess_pieces.where(x: 7, y: 0).first
      when [2, 7]
        return game.chess_pieces.where(x: 0, y: 7).first
      when [6, 7]
        return game.chess_pieces.where(x: 7, y: 7).first
      else
        nil
    end
  end
end
