class King < ChessPiece

  # King specific methods ...
  def valid_move?(x_target, y_target)
    return false if same_location?(x_target, y_target)
    return false if !in_board?(x_target, y_target)
    return true if move_single_step?(x_target, y_target)
    return false
  end

  def valid_castle_move?
    if @king.moved?
      return false
    end
    #has king moved?
    #has rook moved?
    #is there an obstruction?
  end

  def moved?
    if created_at != updated_at
      return true
    end
  end

  def rook_moved?
  end

end
