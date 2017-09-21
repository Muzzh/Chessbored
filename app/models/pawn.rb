class Pawn < ChessPiece

  # Pawn specific methods ...

  # Can go left and right, but only up (for white) and down (for black)
  # 1st move can be 1 or 2 steps
  def valid_move?(x_target, y_target)
  	return false if same_location?(x_target, y_target)
  	return false if !in_board?(x_target, y_target)
    x_dist = (x_target - x).abs
  	y_dist = y_target - y
  	return true if color == "white" && y == 1 && x_dist == 0 && (y_dist == 1 || y_dist == 2)   # 1st move
  	return true if color == "black" && y == 6 && x_dist == 0 && (y_dist == -1 || y_dist == -2) # 1st move 
  	return true if color == "white" && x_dist == 0 && y_dist == 1  # only up
   	return true if color == "black" && x_dist == 0 && y_dist == -1 # only down
  	return true if y_dist == 0 && x_dist == 1 # left or right
 		return false
  end

  # Override in_board?
  # Pawn can go 1 step over the board up (for white) or down (for black)
  def in_board?(x_target, y_target)
    return x_target >= MIN_INDEX && x_target <= MAX_INDEX && 
           y_target >= MIN_INDEX-1 && y_target <= MAX_INDEX+1
  end

end