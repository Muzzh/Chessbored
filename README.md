# ChessBored

[LIVE](https://chessbored.herokuapp.com)

ChessBored is a personal fork from an Agile project I participated in at [The Firehose Project](https://thefirehoseproject.com/). The goal is to build a fully functional multiplayer chess game online, enforcing all the rules related to the game. It is built using Ruby on Rails framework with PostgreSQL database.

## Original Project

This project was part of The Firehose Project curriculum, where five teammates joined forces to build a chess app from scratch. The team's repository can be found [here](https://github.com/MeetingTime404/MeetingTime404).
Contributors to the project were:
- [Timothy](https://github.com/netdev01)
- [Ali](https://github.com/AliLynne)
- [Amie](https://github.com/cthao04)
- [Theresa](https://github.com/tbarin)
- [Xavier](https://github.com/Muzzh)

### Features I built

#### ```obstructed?``` Method

I was tasked with coding the logic business of the method evaluating whether a piece passed through obstructed/occupied squares when a move was processed. I initially coded a very rough but working step by step method, along with RSpec tests ([model's method](https://github.com/MeetingTime404/MeetingTime404/blob/28f10a4ada2f25c35505caab545ee37800cd2c95/app/models/chess_piece.rb), [tests](https://github.com/MeetingTime404/MeetingTime404/blob/28f10a4ada2f25c35505caab545ee37800cd2c95/spec/models/chess_piece_spec.rb)). I refactored the code for better Ruby styling and to get the code as DRY as possible ([refactor branch](https://github.com/MeetingTime404/MeetingTime404/tree/refactor_obstructed)).
<details>
  <summary>Click here for the final version of the method with associated methods</summary>
  
  ```ruby
  def obstructed?(x_target, y_target)
    case
      when horizontal_move?(x_target, y_target)
        horizontal_obstruction?(x_target)
      when vertical_move?(x_target, y_target)
        vertical_obstruction?(y_target)
      when diagonal_move?(x_target, y_target)
        diagonal_obstruction?(x_target, y_target)
      else
        false
    end
  end

  def horizontal_move?(x_target, y_target)
    x != x_target && y == y_target
  end

  def vertical_move?(x_target, y_target)
    x == x_target && y != y_target
  end

  def diagonal_move?(x_target, y_target)
    (x_target - x).abs == (y_target - y).abs
  end

  def horizontal_obstruction?(x_target)
    direction = x_target > x ? 1 : -1
    (x + direction).step(x_target - direction, direction) do |x_current|
      return true if occupied?(x_current, y)
    end
    false
  end

  def vertical_obstruction?(y_target)
    direction = y_target > y ? 1 : -1
    (y + direction).step(y_target - direction, direction) do |y_current|
      return true if occupied?(x, y_current)
    end
    false
  end

  def diagonal_obstruction?(x_target, y_target)
    x_direction = x_target > x ? 1 : -1
    y_direction = y_target > y ? 1 : -1
    (x + x_direction).step(x_target - x_direction, x_direction) do |x_current|
      y_current = y + ((x_current - x).abs * y_direction)
      return true if occupied?(x_current, y_current)
    end
    false
  end

  def occupied?(x_current, y_current)
    game.chess_pieces.where(x: x_current, y: y_current).present?
  end
  def valid_move?(x_target, y_target)
  end
  ```
</details>

