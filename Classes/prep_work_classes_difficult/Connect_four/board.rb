class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(7) { Array.new(6) } #I switched them works if 6 then 7
  end

  def valid_column?(col)
    #returns true or false if pos is nil or not
    return false unless col.between?(0, 6)
    @grid[col].any?(&:nil?)
  end

  def place_mark(col, mark)
    i = 5
    until @grid[col][i].nil?
      i -= 1
    end

    @grid[col][i] = mark
  end

  def over?
    #returns true if there are no nils
    return true if @grid.flatten.none?(&:nil?) || winner
    # returns true if winner
    false #added this
  end

  def winner
    return :X if winner?(:X)
    return :O if winner?(:O)

    nil
    #returns the mark of the winner if there is a winner, else nil
  end

  def winner?(mark)
    lines = get_lines
    fours = []
    lines.each do |line|
      fours += get_consecutives(line)
    end

    fours.any? do |four|
      four.all? { |spot| spot == mark }
    end
  end

  def get_consecutives(line)
    consecutives = []
    i = 0
    while i < line.length - 3 #changed from 4
      consecutives << line[i..i+3]
      i += 1
    end

    consecutives
  end

  def get_lines
    result = []
    result += get_rows
    result += get_columns
    result += get_diagonals(@grid)
    result += get_diagonals(@grid.transpose.reverse) #this rotates 90 deg counter clockwise
    result
  end

  def get_rows
    @grid.transpose
  end

  def get_columns
    @grid
  end

  def get_diagonals(matrix)

    results = []
    y = 0
    while y < matrix.length
      x = 0
      while x < matrix[y].length
        if y == 0 || x == 0
          diagonal = []
          y_plus = y
          x_plus = x
          while y_plus < matrix.length && x_plus < matrix[y].length
            diagonal << matrix[y_plus][x_plus]
            y_plus += 1
            x_plus += 1
          end
          results << diagonal if diagonal.length >= 4 #(look!)
        end
        x += 1
      end
      y += 1
    end

    results
  end

  def [](pos)
    col, row = pos #no clue what this does, copied this from the solution code of mastermind
    @grid[col][row]
  end

  def []=(pos, mark)
    col, row = pos
    @grid[col][row] = mark
  end

end
