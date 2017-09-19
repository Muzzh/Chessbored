class Pawn < ChessPiece

  # Pawn specific methods ...

  def valid_move?(x_target, y_target)
  	return false if same_location?(x_target, y_target)
  	return false if !in_board?(x_target, y_target)
  	x_dist = (x - x_target).abs
  	y_dist = (y - y_target).abs
 		return true if (x_dist == 0 && y_dist == 1) || 
 								   (x_dist == 1 && y_dist == 0)
 		return false
  end

  # Override in_board?
  # Pawn can go 1 step over the board "on the top".
  def in_board?(x_target, y_target)
    return x_target >= MIN_INDEX && x_target <= MAX_INDEX && 
           y_target >= MIN_INDEX && y_target <= MAX_INDEX+1
  end

end