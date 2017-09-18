class King < ChessPiece

  # King specific methods ...
  def valid_move?(x_target, y_target)
  	return false if same_location?(x_target, y_target)
  	return false if !in_board?(x_target, y_target)
  	x_dist = (x - x_target).abs
  	y_dist = (y - y_target).abs
  	return true if x_dist == 0 && y_dist == 1
  	return true if y_dist == 0 && x_dist == 1
  	return false
  end

end