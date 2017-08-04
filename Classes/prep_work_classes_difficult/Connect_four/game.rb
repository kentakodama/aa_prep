
require_relative 'board'
require_relative 'human_player'



class ConnectFour

  attr_accessor :board

  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2
    @p1.mark = :X
    @p2.mark = :O
    @board = Board.new
    @current_player = @p1
  end

  def play
    play_turn until @board.over?
    puts @current_player.display(@board)
    puts game_over_message
  end

  def game_over_message
    if @board.winner.nil?
      "No winner!"
    else
      "#{@current_player.name} wins!!!"
    end
  end

  def play_turn
    #displays board
    puts @current_player.display(@board)
    #asks for move column
    column = @current_player.get_move
    #asks again if column is unavailable

    until @board.valid_column?(column)
      column = @current_player.get_move
    end

    @board.place_mark(column, @current_player.mark)
    switch_players! unless @board.over?
  end

  def switch_players!
    if @current_player == @p2
      @current_player = @p1
    else
      @current_player = @p2
    end
  end
end

if $0 == __FILE__

  p1 = HumanPlayer.new("Chris")
  p2 = HumanPlayer.new("Kenta")
  game = ConnectFour.new(p1, p2)
  game.play


end
