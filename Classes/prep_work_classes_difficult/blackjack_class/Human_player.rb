class HumanPlayer

  attr_accessor :hand, :name, :hold

  def initialize(name)
    @name = name
    @hand = {}
    @hold = false
  end

  def total
      @hand.values.reduce(:+)
  end

  def bust?
    return true if total > 21
    false
  end

  def get_move
    p "Hello #{@name}, your hand is: #{@hand.keys}"
    p "You are at #{total}"
    p "Do you want to hit or hold?"
    answer = gets.chomp
    until ['hit', 'hold'].include?(answer)
      p "Hey are you listening? Do you want to hit or hold?"
      answer = gets.chomp
    end
    answer
  end


end
