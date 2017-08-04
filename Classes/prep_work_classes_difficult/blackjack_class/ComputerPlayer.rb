class ComputerPlayer
  attr_accessor :hand, :name, :hold

  def initialize(name = 'Computer')
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
    if total < 16
      return "hit"
    else
      return "hold"
    end
  end

end
