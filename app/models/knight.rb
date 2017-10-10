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
    return false if !super
    @@offsets.each do |offset| 
      return true if x_target == x + offset[:x] && y_target == y + offset[:y]
    end
    return false
  end

  def obstructed?(x_target, y_target)
    return false
  end
end