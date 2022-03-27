# frozen_string_literal: true

EMPTY_CELL = ' '

# Contains state of board
class Board
  attr_reader :board, :pos

  def initialize
    @board = Array.new(8) { Array.new(8, EMPTY_CELL) }
  end

  # after player chooses column, we loop starting from the last row
  # once nil is found then places the checker
  # returns position of placed checker
  def place_checker(col, checker)
    return @pos = [-1, -1] unless col.between?(0, 7)

    7.downto(0) do |row|
      if @board[row][col] == EMPTY_CELL
        @board[row][col] = checker
        return @pos = [row, col]
      end
    end

    @pos = [-1, -1]
  end

  def to_s
    s = "0 1 2 3 4 5 6 7\n"

    @board.each do |row|
      s += "#{row.join('|')}\n"
    end

    s += '- - - - - - - -'
  end
end
