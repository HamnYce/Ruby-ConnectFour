# frozen_string_literal: true

# Board Class
# Driver Class
# Winner Module
# Text Module

# \u26AA (white checker)
# \u26AB (black checker)

# 8 columns by 8 rows

winner_board = Array.new(8) { Array.new(8, nil) }
(0..3).each { |i| winner_board[7][i] = 'x' }

winner_board.each { |arr| p arr }
