class Board

  attr_reader :grid, :grid_size

  def initialize(grid_size, num_bombs)
    #@grid_size = grid_size (not necessary)
    @num_bombs = num_bombs

  end


  def generate_grid #below will create tiles automatically
    @grid = Array.new(grid_size) do |row|
      Array.new(grid_size) do |col|
        Tile.new(row, col, self) #passing board into
      end
    end
  end

  def lost?

  end

  def win?

  end



  def plant_some_bombs
    total_bombs = 0
    until total_bombs == @num_bombs
      rand_row, rand_col = Array.new(2){rand(@grid_size)}
      tile = @grid[rand_row][rand_col]
      unless tile.has_bomb?
        tile.plant_bomb
        total_bombs += 1
      end
    end
  end

  def render
    @grid.map do |row|
      row.map do |tile|
        tile.render
      end.join
    end.join("\n")
  end

end
