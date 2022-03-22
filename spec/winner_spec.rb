# frozen_string_literal: true

WHITE_CHECKER = 'x'
BLACK_CHECKER = 'o'
MAX_BOARD_ROW = 8
MAX_BOARD_COL = 8

require_relative '../lib/winner'

RSpec.describe 'Winner' do
  describe '::horizontal?' do
    context 'when board is empty' do
      let(:empty_board) { Array.new(8) { Array.new(8, nil) } }

      it 'returns false' do
        position = [1, 2]
        expect(Winner).to_not be_horizontal(empty_board, position, WHITE_CHECKER)
      end
    end

    context 'when 4 consecutive white checkers in any column and row' do
      let(:win_board_variant) { Array.new(8) { Array.new(8, nil) } }

      context 'when sign is white checker' do
        it 'returns true' do
          (0..7).each do |row|
            (0..4).each do |col|
              4.times.each do |offset|
                win_board_variant[row][col + offset] = WHITE_CHECKER
              end
              expect(Winner).to be_horizontal(win_board_variant, [row, col], WHITE_CHECKER)
            end
            win_board_variant = Array.new(8) { Array.new(8, nil) }
          end
        end
      end

      context 'when sign is not white checker' do
        it 'returns false' do
          (0..7).each do |row|
            (0..4).each do |col|
              4.times.each do |offset|
                win_board_variant[row][col + offset] = WHITE_CHECKER
              end
              expect(Winner).to_not be_horizontal(win_board_variant, [row, col], BLACK_CHECKER)
            end
            win_board_variant = Array.new(8) { Array.new(8, nil) }
          end
        end
      end

      let(:winner_board) { Array.new(8) { Array.new(8, nil) } }

      it 'returns true' do
        (0..3).each { |i| winner_board[7][i] = WHITE_CHECKER }
        position = [7, 0]
        expect(Winner).to be_horizontal(winner_board, position, WHITE_CHECKER)
      end

      context 'then black' do
        it 'returns true' do
          (0..3).each { |i| winner_board[7][i] = WHITE_CHECKER }
          (4..7).each { |i| winner_board[7][i] = BLACK_CHECKER }
          position = [7, 0]
          expect(Winner).to be_horizontal(winner_board, position, WHITE_CHECKER)
        end
      end
    end

    context 'when first row has 3 white checker in a row' do
      let(:stale_board) { Array.new(8) { Array.new(8, nil) } }

      it 'return false' do
        (0..2).each { |i| stale_board[7][i] = WHITE_CHECKER }
        position = [7, 0]
        expect(Winner).to_not be_horizontal(stale_board, position, WHITE_CHECKER)
      end

      context 'then black' do
        it 'return false' do
          (0..2).each { |i| stale_board[7][i] = WHITE_CHECKER }
          stale_board[7][3] = BLACK_CHECKER
          position = [7, 0]
          expect(Winner).to_not be_horizontal(stale_board, position, WHITE_CHECKER)
        end
      end
    end
  end

  describe '::vertical?' do
  end
end
