
class ComputerPlayer

    attr_accessor :name, :mark, :get_move, :board

    def initialize(name)
      @name = name
      @mark = nil
    end

    #still have to complete first gonna do the game class
    def display(game) #this game refers to an instance of the game class
      @board = game
    end

    def get_move
    #loop through the grid and get all possible moves
    possible_moves = []
    (0..2).each do |y|
      (0..2).each do |x|
        pos = [y, x]
        possible_moves << pos if @board.empty?(pos) #changed to @board from board
      end
    end
    #return move if one of those moves will win?
    possible_moves.each do |move|
      return move if winning_move?(move)
    end

    #else return a random positon
    possible_moves.sample

  end

  private

  def winning_move?(move)
    y = move.first
    x = move.last
    @board.grid[y][x] = @mark #temporarily change nil to mark to evaluate below
    if @board.winner == @mark #remember winner returns nil or the winning mark
      @board.grid[y][x] = nil #reset position to nil, place_mark will officially mark it
      return true
    else
      @board.grid[y][x] = nil
      return false
    end
  end

end
