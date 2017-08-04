#board class
  #any changes/checks to the board occur here
  #check if space is available
  # make move from player input
  #win?
  #over?
  #display the board

class Board

  def initialize
    @grid = Array.new(3){Array.new(3)}
  end

  def display
    p @grid
  end

  def place_mark(pos, mark)
    #get_move until the space they enter is empty?
    y = pos.first
    x = pos.last
    @grid[y][x] = mark

  end

  def empty?(pos)
    y = pos.first
    x = pos.last
    return true if @grid[y][x]
    false
    #be able to check if space is nil from
  end

  def over?
    return true if win? != false
    return true if @grid.flatten.none?{|el| el == nil}
    false
  end

  def win?
    lines = get_lines
    return :X if lines.any? { |line| line == [:X, :X, :X]}
    return :O if lines.any? {|line| line == [:O, :O, :O]}
    false
  end


  private

  def get_lines
    lines = []
    @grid.each {|row| lines << row}
    @grid.transpose.each {|column| lines << column}
    lines << get_diagonal(@grid)
    lines << get_diagonal(@grid.transpose.reverse)
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

end

#player classes(two versions)
class HumanPlayer
  attr_accessor :mark, :name

  def initialize(name)
    @name = name
    @mark = nil
  end

  def get_move
    p 'Hello, #{@name} please enter your move'
    str = gets.chomp
    str.split(',').map{|string| string.to_i}
  end

end


  #computer_player

  #human_player
  #must be assigned a mark
  #must have a display method to show board
  #must have a get_move
