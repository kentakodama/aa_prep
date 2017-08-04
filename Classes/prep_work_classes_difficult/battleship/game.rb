class BattleshipGame
  attr_reader :board, :player

  def initialize
    @board = Board.new
    @player = HumanPlayer.new
  end

  def play
    @board.populate_grid
    @board.display
    until over?
      play_turn
    end
  end

  def [](i) #no clue what this does, copied this from the solution code of mastermind
    @grid[i]
  end #for some reason even though instance#grid is an array, cant access index unless this is written

  def play_turn
    target = nil
    until @board.in_range?(target) #review this, important
      target = @player.get_input
    end
    attack(target)
    display_status
  end

  def attack(pos)
    y = pos[0]
    x = pos[1]
    @board[y][x] = :X if @board[y][x] == :S
    @board[y][x] = :M if @board[y][x] == :O
  end

  def display_status
    @board.display
  end

  def over?
    @board.grid.flatten.all?{|el| el != :S}
  end


end
