
class HumanPlayer

  attr_accessor :name, :tiles, :display

  def initialize(name)
    @name = name
    @tiles = []
  end

  def choose_letter
    p "Hi, #{@name}! Please choose a letter!"
    gets.chomp.downcase
  end

end
