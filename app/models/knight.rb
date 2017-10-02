class Knight < ChessPiece

  # Knight specific methods ...

  # the valid offsets form its original location
  @@offsets = 
    [ {x:  1, y:  2},
      {x:  1, y: -2},
      {x: -1, y:  2},
      {x: -1, y: -2},
      {x:  2, y:  1},
      {x:  2, y: -1},
      {x: -2, y:  1},
      {x: -2, y: -1}  ]

  # iterate through valid offsets to determine valid target locations
  def valid_move?(x_target, y_target)
    return false if same_location?(x_target, y_target)
    return false if !in_board?(x_target, y_target)
    result = false
    @@offsets.each do |offset| 
      if x_target == x + offset[:x] && y_target == y + offset[:y]
        result = true
      end
    end
    return result
  end

end