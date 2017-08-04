
class Board

  attr_accessor :grid #this eventually allows access to board.grid method

  def self.blank_grid #not the only way, but clean way to use factory method
    Array.new(3) { Array.new(3) }
  end

  def initialize(grid = Board.blank_grid)
    @grid = grid
  end

  def place_mark(pos, mark) #takes Array
      #if the pos is empty then mark else raise error
      if empty?(pos)
        y = pos[0]
        x = pos[1]
        @grid[y][x] = mark
      else
        raise 'Error'
      end
  end

  def empty?(pos)

    y = pos[0]
    x = pos[1]
    return true if @grid[y][x] == nil

    false
  end

  def winner

    lines = get_lines(@grid)
    #include?() must have parantheses if taking array
    return :X if lines.include?([:X, :X, :X])
    return :O if lines.include?([:O, :O, :O])

    nil

  end

  def over?
    return winner if winner != nil
    return 'cats game' unless @grid.flatten.include?(nil)
    false
  end

  private


  def get_lines(matrix)
    lines = []
    matrix.each {|row| lines << row}
    matrix.transpose.each {|column| lines << column}
    lines << get_diagonal(matrix)
    lines << get_diagonal(matrix.transpose.reverse)
    lines
  end

  def get_diagonal(grid)
    line = []
    i = 0
    while i < grid.length
      line << grid[i][i]
      i += 1
    end
    line
  end

end
