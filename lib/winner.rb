# frozen_string_literal: true

# contains methods to check all surrounding checkers for winning combinations
# using a recursive approach
# this is a static class, therefore you can use it without making an instance
# just pass in the board, position to start from, and required consecutive signs
class Winner
  def self.winning_board?(board, pos, sign)
    horizontal?(board, pos, sign) ||
      vertical?(board, pos, sign) ||
      leading_diagonal?(board, pos, sign) ||
      non_leading_diagonal?(board, pos, sign)
  end

  def self.non_leading_diagonal?(board, pos, sign)
    (-1 + non_leading_diag_down(board, pos, sign) +
          non_leading_diag_up(board, pos, sign)) >= 4
  end

  def self.non_leading_diag_down(board, pos, sign)
    return 0 unless pos[0] < 8 && pos[1] > -1
    return 0 if board[pos[0]][pos[1]] != sign

    1 + non_leading_diag_down(board, [pos[0] + 1, pos[1] - 1], sign)
  end

  def self.non_leading_diag_up(board, pos, sign)
    return 0 unless pos[0] > -1 && pos[1] < 8
    return 0 if board[pos[0]][pos[1]] != sign

    1 + non_leading_diag_up(board, [pos[0] - 1, pos[1] + 1], sign)
  end

  def self.leading_diagonal?(board, pos, sign)
    (-1 + leading_diag_down(board, pos, sign) +
          leading_diag_up(board, pos, sign)) >= 4
  end

  def self.leading_diag_down(board, pos, sign)
    return 0 unless pos[0].between?(0, 7) && pos[1].between?(0, 7)
    return 0 if board[pos[0]][pos[1]] != sign

    1 + leading_diag_down(board, [pos[0] + 1, pos[1] + 1], sign)
  end

  def self.leading_diag_up(board, pos, sign)
    return 0 unless pos[0].between?(0, 7) && pos[1].between?(0, 7)
    return 0 if board[pos[0]][pos[1]] != sign

    1 + leading_diag_up(board, [pos[0] - 1, pos[1] - 1], sign)
  end

  def self.vertical?(board, pos, sign)
    (-1 + ver_rec_up(board, pos, sign) + ver_rec_down(board, pos, sign)) >= 4
  end

  def self.ver_rec_up(board, pos, sign)
    return 0 unless pos[0].between?(0, 7)
    return 0 if board[pos[0]][pos[1]] != sign

    1 + ver_rec_up(board, [pos[0] - 1, pos[1]], sign)
  end

  def self.ver_rec_down(board, pos, sign)
    return 0 unless pos[0].between?(0, 7)
    return 0 if board[pos[0]][pos[1]] != sign

    1 + ver_rec_down(board, [pos[0] + 1, pos[1]], sign)
  end

  def self.horizontal?(board, pos, sign)
    (-1 + hor_rec_left(board, pos, sign) + hor_rec_right(board, pos, sign)) >= 4
  end

  def self.hor_rec_left(board, pos, sign)
    return 0 unless pos[1].between?(0, 7)
    return 0 if board[pos[0]][pos[1]] != sign

    1 + hor_rec_left(board, [pos[0], pos[1] - 1], sign)
  end

  def self.hor_rec_right(board, pos, sign)
    return 0 unless pos[1].between?(0, 7)
    return 0 if board[pos[0]][pos[1]] != sign

    1 + hor_rec_right(board, [pos[0], pos[1] + 1], sign)
  end
end
