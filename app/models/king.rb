class King < ChessPiece

  # King specific methods ...
  def valid_move?(x_target, y_target)
    return false if same_location?(x_target, y_target)
    return false if !in_board?(x_target, y_target)
    return true if move_single_step?(x_target, y_target)
    return false
  end

  def valid_castle_move?(x_target, y_target)
    #has king moved?
    #has rook moved?
    #is there an obstruction?
  end

  def moved?
    if @selected_piece.created_at != @selected_piece.updated_at
      return true
    end
  end


end
