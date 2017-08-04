require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_accessor :board, :current_player, :player_one, :player_two, :play_turn

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_one.mark = :X
    @player_two.mark = :O
    @board = Board.new
    @current_player = @player_one
  end

  #@board is now an instance of board class


  def play
    until @board.over?
      play_turn
    end
  end

  def play_turn
    position = @current_player.get_move
    mark = @current_player.mark
    @board.place_mark(position, mark)
    switch_players!
  end

  def switch_players!
    @current_player = @player_one if @current_player == @player_two
    @current_player = @player_two if @current_player == @player_one
  end

end


# if  __FILE__ == $PROGRAM_NAME

  print "Enter your name: "
  name = gets.chomp.strip
  human = HumanPlayer.new(name)
  garry = ComputerPlayer.new('garry')

  new_game = Game.new(human, garry)
  new_game.play
#end
