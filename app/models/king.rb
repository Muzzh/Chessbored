class King < ChessPiece

  # King specific methods ...
  def valid_move?(x_target, y_target)
    return false if same_location?(x_target, y_target)
    return false if !in_board?(x_target, y_target)
    return true if move_single_step?(x_target, y_target)
    return false
  end

  def valid_castle_move?
    return false if @piece.moved?
    #has rook moved?
    #is there an obstruction?
  end

  def moved?
     created_at == updated_at ? false : true
  end


end
