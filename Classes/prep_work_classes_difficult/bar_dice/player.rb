
require_relative 'die'

#notes
#player should replicate everything a player might be able to do
#roll dice, come up with the hand to use by matching frequencies etc

class Player

  attr_accessor :name, :hand

  def initialize(name)
    @name = name
  end

  def throw_dice
    combo = []
    5.times { combo << Die.roll }
    combo
  end

  def get_hand(die) #this is an array of nums

    @hand = Hash.new
    @hand[:most_freq] = get_most_freq(die)
    @hand[:frequency] = get_frequency(die)
    @hand[:ace] = die.include?(1)
  end

  def get_most_freq(die)
    frequencies_hash = frequencies(die)
    frequencies_hash.select { | num, _times | num > 1 }
    frequencies_hash.max_by { | _num, times | times }[0]
  end

  def get_frequency(die)
    frequencies_hash = frequencies(die)
    most = get_most_freq(die)
    frequencies_hash[most] + frequencies_hash[1]
  end

  def frequencies(die)
    freq = Hash.new(0)
    die.each { |num| freq[num] += 1 }
    freq
  end

end

# if $0 == __FILE__ #this is the short form
#   p 'Enter player one name'
#   player1 = Player.new(gets.chomp)
# end
