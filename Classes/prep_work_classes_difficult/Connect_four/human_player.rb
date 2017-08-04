

class HumanPlayer

  attr_accessor :mark, :name

  def initialize(name)
    @name = name
    @mark = nil
  end
  
  def display(board)

    results = []
    board.grid.transpose.each do |row|
      results << display_row(row)
    end

    results.join("\n-----------------------\n")

  end

  def display_row(row)
    strings = row.map do |tile|
      if tile.nil?
        " "
      else
        tile.to_s
      end
    end
    strings.join(' | ')
  end

  def get_move
    p "Hey #{@name} which column?"
    gets.chomp.to_i
  end


end
