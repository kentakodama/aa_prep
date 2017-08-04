class tile


  DELTAS = [[-1, -1],
            [-1, 0],
            [-1, 1],
            [0, -1],
            [0, 1],
            [1, -1],
            [1, 0],
            [1, 1]]

  def initialize(row, col, board) #must have a reference to board
    @row = row
    @col = col
    @is_bomb, @explored, @flagged = false, false, false
    @board = board
  end

  def has_bomb?
    @is_bomb
  end

  def is_explored?
    @explored
  end

  def flagged?
    @flagged
  end

  def toggle_flag
    @flagged = !@flagged
  end

  #this is where the recursion occurs
  #one tile will make the another tile 
  def explore

  end


  def adjacent_bomb_count
    count = 0
    neighbors.each |tile| #neighbors is a method but it returns an array so you can call array methods on it
      count += 1 if tile.has_bomb?
    end
    count
  end

  def plant_bomb
    @is_bomb = true
  end

  def explore
    @explore = true
  end

  def flag
    @flagged = true
  end

  def neighbors
    adjacent_coordinates = DELTAS.map do |delta|
      [@row + delta[0], @col + delta[1]]
    end.select do |coordinate|
      coordinate.all? {|coord| coord.between?(0, @board.grid_size - 1)}
    end #just selecting valid locations

    adjacent_coordinates.map do |coord|
      row, col = coord[0], coord[1]
      @board.grid[row][col]
    end  #get the tiles at those locations

  end


  def render
    if @flagged
      "F"
    elsif @is_bomb
      "B"
    end

  end

end
