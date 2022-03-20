# frozen_string_literal: true

class Winner
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
