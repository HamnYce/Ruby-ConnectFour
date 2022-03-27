# frozen_string_literal: true

require_relative 'board'
require_relative 'winner'

WHITE_CHECKER = "x" # \u26AA (white checker)
BLACK_CHECKER = "o" # \u26AB (black checker)

# mixes the board with the text statements from Text module
class Driver
  attr_reader :board, :turn, :current_player, :checker, :pos

  def initialize
    @board = Board.new
    @pos = [-1, -1]
    @turn = 1
    player_names
    @current_player = @player_one
    @checker = WHITE_CHECKER
    game_loop
  end

  def game_loop
    game_turn

    until Winner.winning_board?(@board.board, [@pos[0], @pos[1]], @checker) ||
          @turn == 34

      @turn += 1
      @pos = [-1, -1]
      @checker = (@checker == WHITE_CHECKER ? BLACK_CHECKER : WHITE_CHECKER)
      puts @board

      game_turn
    end

    finish_game
  end

  def game_turn
    while @pos == [-1, -1]
      print 'enter the column to place checker: '
      col = gets.chomp.to_i
      @pos = @board.place_checker(col, @checker)
    end
  end

  def finish_game
    puts @board
    if @turn == 34
      puts 'Game ended in a draw, the checkers ran out!'
    elsif @turn.odd?
      puts "#{@player_one} is the winner!"
    else
      puts "#{@player_two} is the winner!"
    end
  end

  private

  def player_names
    print 'player one name: '
    @player_one = gets.chomp
    print 'player two name: '
    @player_two = gets.chomp
  end
end
