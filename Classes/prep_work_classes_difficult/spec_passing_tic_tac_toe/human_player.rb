class HumanPlayer

  attr_accessor :name, :mark, :get_move, :move

  def initialize(name)
    @name = name
    @mark = nil
  end
  #
  #still have to complete first gonna do the game class
  def display(game) #this game refers to an instance of the game class
    p game.grid #WOWOW
  end

  def get_move
    p "Where?"
    string = gets.chomp
    string.split(',').map { |str| str.to_i }
  end

end
#
