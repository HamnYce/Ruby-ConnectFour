# frozen_string_literal: true

WHITE_CHECKER = 'x'
BLACK_CHECKER = 'o'
MAX_BOARD_ROW = 8
MAX_BOARD_COL = 8


require_relative '../lib/winner'
#TODO : test all rows of program for each test
# or do first row, last row and middle row
RSpec.describe 'Winner' do
  describe '::horizontal?' do
    context 'when board is empty' do
      let(:empty_board) { Array.new(8) { Array.new(8, nil) } }

      it 'returns false' do
        position = [1, 2]
        expect(Winner).to_not be_horizontal(empty_board, position, 'x')
      end
    end

    context 'when bottom row has 4 white checker in a row' do
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
end
