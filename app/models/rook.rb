class Rook < ChessPiece

  # Rook specific methods ...

  # check horizontal and vertical
  def valid_move?(x_target, y_target)
  	return false if same_location?(x_target, y_target)
  	return false if !in_board?(x_target, y_target)
  	# return false if is_obstructed?(x_target, y_target)
  	return true if (x == x_target && y != y_target) || 
  								 (x != x_target && y == y_target)
 		return false
  end

end