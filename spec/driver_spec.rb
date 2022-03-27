# frozen_string_literal: true

require_relative '../lib/driver'

RSpec.describe 'Driver' do
  before do
    allow_any_instance_of(Driver).to receive(:player_names)
    allow_any_instance_of(Driver).to receive(:puts)
    allow_any_instance_of(Driver).to receive(:print)
    allow_any_instance_of(Driver).to receive(:start)
  end

  subject(:driver) { Driver.new }

  describe '#game_loop' do
    before do
      allow(driver).to receive(:game_turn)
      allow(driver).to receive(:finish_game)
    end

    context 'when @turn == 34' do
      before do
        driver.instance_variable_set(:@turn, 34)
      end

      it 'call #finish_game' do
        expect(driver).to receive(:finish_game)
        driver.game_loop
      end
    end

    context 'when Winner#winner_board is true' do
      it 'calls #finish_game' do
        expect(driver).to receive(:finish_game)
        driver.game_loop
      end
    end

    context 'when loop condition is false' do
      context 'once then true' do
        before do
          allow(Winner).to receive(:winning_board?).and_return(false, true)
        end

        it 'calls #game_turn two times' do
          expect(driver).to receive(:game_turn).exactly(2).times
          driver.game_loop
        end
      end

      context 'twice then true' do
        before do
          allow(Winner).to receive(:winning_board?).and_return(false, false, true)
        end

        it 'call #game_turn four times' do
          expect(driver).to receive(:game_turn).exactly(3).times
          driver.game_loop
        end
      end
    end
  end

  describe '#game_turn' do
    let(:board) { double('board') }

    before do
      allow(driver).to receive(:print)
    end

    context 'when @pos == [-1, 1]' do
      before do
        allow(board).to receive(:place_checker).and_return([-1, -1], [1, 2])
        driver.instance_variable_set(:@board, board)
      end

      context 'once then [1,2]' do
        it 'calls print twice' do
          expect(driver).to receive(:print).twice
          driver.game_turn
        end

        it '@pos becomes [1, 2]' do
          driver.game_turn
          expect(driver.pos).to eq([1, 2])
        end
      end

      context 'twice then [1,2]' do
        before do
          allow(board).to receive(:place_checker).and_return([-1, -1], [-1, -1],[1, 2])
          driver.instance_variable_set(:@board, board)
        end

        it 'calls print 3 times' do
          expect(driver).to receive(:print).thrice
          driver.game_turn
        end

        it '@pos becomes [1, 2]' do
          driver.game_turn
          expect(driver.pos).to eq([1, 2])
        end
      end
    end
  end
end
