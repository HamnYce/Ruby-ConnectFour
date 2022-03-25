# frozen_string_literal: true

WHITE_CHECKER = 'x'
BLACK_CHECKER = 'o'
ROW_COUNT = 8
COL_COUNT = 8

require_relative '../lib/winner'

RSpec.describe 'Winner' do
  describe '::horizontal?' do
    context 'when board is empty' do
      let(:empty_board) { Array.new(ROW_COUNT) { Array.new(8, COL_COUNT) } }

      it 'returns false' do
        position = [1, 2]
        expect(Winner).to_not be_horizontal(empty_board, position, WHITE_CHECKER)
      end
    end

    context 'when 4 consecutive white checkers in any row' do
      let(:win_board_row) { Array.new(ROW_COUNT) { Array.new(COL_COUNT, nil) } }

      context 'when sign is white checker' do
        it 'returns true' do
          (0..7).each do |row|
            win_board_row = Array.new(ROW_COUNT) { Array.new(COL_COUNT, nil) }
            (0..4).each do |col|
              4.times.each do |offset|
                win_board_row[row][col + offset] = WHITE_CHECKER
              end
              expect(Winner).to be_horizontal(win_board_row, [row, col], WHITE_CHECKER)
            end
          end
        end
      end
    end

    context 'when checking sign is not same as position sign' do
      let(:white_checker_board) { Array.new(ROW_COUNT) { Array.new(COL_COUNT, WHITE_CHECKER) } }

      it 'returns false' do
        pos = [1, 2]
        expect(Winner).to_not be_horizontal(white_checker_board, pos, BLACK_CHECKER)
      end
    end
  end

  describe '::vertical?' do
    context 'when 4 consecutive white checkers in any column' do
      let(:win_board_col) { Array.new(ROW_COUNT) { Array.new(COL_COUNT, nil) } }

      context 'when sign is white checker' do
        it 'returns true' do
          (0..7).each do |col|
            win_board_col = Array.new(ROW_COUNT) { Array.new(COL_COUNT, nil) }
            (0..4).each do |row|
              4.times.each do |offset|
                win_board_col[row + offset][col] = WHITE_CHECKER
              end
              expect(Winner).to be_vertical(win_board_col, [row, col], WHITE_CHECKER)
            end
          end
        end
      end
    end

    context 'when checking sign is not same as position sign' do
      let(:bad_sign) { Array.new(ROW_COUNT) { Array.new(COL_COUNT, WHITE_CHECKER) } }

      it 'returns false' do
        pos = [1, 2]
        expect(Winner).to_not be_vertical(bad_sign, pos, BLACK_CHECKER)
      end
    end
  end

  describe '::leading_diagonal?' do
    context 'when 4 consecutive white checkers' do
      let(:win_board_lead_diag) { Array.new(ROW_COUNT) { Array.new(COL_COUNT, nil) } }

      context 'when leading diagonal' do
        it 'returns true' do
          (0..4).each do |row|
            win_board_lead_diag = Array.new(ROW_COUNT) { Array.new(COL_COUNT, nil) }
            (0..4).each do |col|
              4.times do |offset|
                win_board_lead_diag[row + offset][col + offset] = WHITE_CHECKER
              end
              expect(Winner).to be_leading_diagonal(win_board_lead_diag, [row, col], WHITE_CHECKER)
            end
          end
        end
      end
    end

    context 'when checking sign is not same as position sign' do
      let(:bad_sign) { Array.new(ROW_COUNT) { Array.new(COL_COUNT, WHITE_CHECKER) } }

      it 'returns false' do
        pos = [0, 0]
        expect(Winner).to_not be_leading_diagonal(bad_sign, pos, BLACK_CHECKER)
      end
    end
  end

  describe '::non_leading_diagonal?' do
    context 'when non-leading diagonal' do
      let(:win_board_non_lead_diag) { Array.new(ROW_COUNT) { Array.new(COL_COUNT, nil) } }

      it 'returns true' do
        (0..4).each do |row|
          (3..7).each do |col|
            4.times do |offset|
              win_board_non_lead_diag[row + offset][col - offset] = WHITE_CHECKER
            end
            expect(Winner).to be_non_leading_diagonal(win_board_non_lead_diag, [row, col], WHITE_CHECKER)
          end
        end
      end
    end

    context 'when checking sign is not same as position sign' do
      let(:bad_sign) { Array.new(ROW_COUNT) { Array.new(COL_COUNT, WHITE_CHECKER) } }

      it 'returns false' do
        pos = [1, 2]
        expect(Winner).to_not be_non_leading_diagonal(bad_sign, pos, BLACK_CHECKER)
      end
    end
  end
end
