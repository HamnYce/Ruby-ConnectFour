# frozen_string_literal: true

# Contains state of board
class Board
  def initialize
    @state = Array.new(8, Array.new(8, nil))
  end

  def place_checker(column)
    # player chooses column in other script method,
    # keeps going down in  rows (i) until next board(i)(column) is != nil |
    # out_of_bounds
  end
end
