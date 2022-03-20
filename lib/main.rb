# frozen_string_literal: true

# Board Class
# Driver Class
# Winner Module
# Text Module

# \u26AA (white checker)
# \u26AB (black checker)

# 8 columns by 8 rows

# recursive approach to finding the solution
# recursively add horizontal pieces after each play
# same concept for vertical and diagonal
# TODO: How to test this

=begin 
  def horizontal
    hor_rec(color, last_position_played) >= 4
  end

  def hor_rec(color, position)
    return 0 if position[0].negative? || position[1].negative?

    if color == position.color
      return 1 + hor_rec(color, pos_front) + hor_rec(color, pos_back) 
    else
      return 0
    end
  end
=end

=begin
  Winner class will be static class.
  all methods will accept the board (size shouldn't matter ;)
  and analyse the board recursively, using the above algorithm
=end

winner_board = Array.new(8) { Array.new(8, nil) }
(0..3).each { |i| winner_board[7][i] = 'x' }

winner_board.each { |arr| p arr }
