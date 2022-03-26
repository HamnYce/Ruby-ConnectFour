# frozen_string_literal: true

require_relative '../lib/board'

WHITE_CHECKER = 'x'
BLACK_CHECKER = 'o'
ROW_COUNT = 8
COL_COUNT = 8

RSpec.describe 'Board' do
  describe '#place_checker' do
    subject(:empty_board) { Board.new }

    context 'when placing in invalid column' do
      context 'when column is -1' do
        it 'returns [-1, -1]' do
          expect(empty_board.place_checker(-1, WHITE_CHECKER)).to eq([-1, -1])
        end
      end

      context 'when column is 8' do
        it 'return [-1, -1]' do
          expect(empty_board.place_checker(8, WHITE_CHECKER)).to eq([-1, -1])
        end
      end
    end

    context 'when the board is empty' do
      context 'when placing checker' do
        context 'in column 0' do
          it '@board[7][0] is white checker ' do
            empty_board.place_checker(0, WHITE_CHECKER)
            expect(empty_board.board[7][0]).to eq(WHITE_CHECKER)
          end

          it 'returns [7, 0]' do
            expect(empty_board.place_checker(0, WHITE_CHECKER)).to eq([7, 0])
          end
        end

        context 'in column 7' do
          it '@board[7][7] is white checker' do
            empty_board.place_checker(7, WHITE_CHECKER)
            expect(empty_board.board[7][7]).to eq(WHITE_CHECKER)
          end

          it 'returns [7, 7]' do
            expect(empty_board.place_checker(7, WHITE_CHECKER)).to eq([7, 7])
          end
        end

        context 'in column 2' do
          it '@board[7][2] is white checker' do
            empty_board.place_checker(2, WHITE_CHECKER)
            expect(empty_board.board[7][2]).to eq(WHITE_CHECKER)
          end

          it 'returns [7, 2]' do
            expect(empty_board.place_checker(2, WHITE_CHECKER)).to eq([7, 2])
          end
        end

        context 'in full column 0' do
          let(:full_board) { Board.new }

          it 'return [-1, -1]' do
            (0..7).each { |row| full_board.board[row][0] = WHITE_CHECKER }
            expect(full_board.place_checker(0, WHITE_CHECKER)).to eq([-1, -1])
          end
        end
      end
    end

    context 'when column has 1 checker' do
      context 'in column 0' do
        subject(:one_column) { Board.new }

        it 'returns [6, 0]' do
          one_column.place_checker(0, WHITE_CHECKER)
          expect(one_column.place_checker(0, WHITE_CHECKER)).to eq([6, 0])
        end
      end
    end

    context 'when placing in full column' do
      subject(:full_column) { Board.new }

      before do
        8.times { |_i| full_column.place_checker(0, WHITE_CHECKER) }
      end

      it 'returns [-1, -1]' do
        expect(full_column.place_checker(0, WHITE_CHECKER)).to eq([-1, -1])
      end
    end
  end
end
