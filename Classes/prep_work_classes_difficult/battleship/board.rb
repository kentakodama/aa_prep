
class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(5) {Array.new(5, :O)}
  end

  def populate_grid
    4.times do
      y_random = rand(5)
      x_random = rand(5)
      @grid[y_random][x_random] = :S
    end
    @grid
  end

  def display
    p @grid
  end

  def count
    @grid.flatten.count(:S)
  end

  def in_range?(pos) #array of positions must convert somehow
    return false if pos == nil

    y = pos[0]
    x = pos[1]
    return false if @grid[y][x] == nil

    true
  end

end
