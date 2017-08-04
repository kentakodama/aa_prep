
require_relative 'player'
require_relative 'die'
require 'byebug'

class BarDice

  attr_accessor :participants, :ranking, :round

  def initialize(*players)
    @players = players
  end

  def play
    @participants = @players.dup
    @round = 1
    until @participants.count == 1
      play_round
      @round += 1
    end
    p "#{@participants[0].name} loses!"
  end

  def play_round
    confirm_play unless @round == 1
    @participants.each do |roller|
      # player.hand =
      give_turn_to(roller)
    end #this generates the best possible hand
    winner = score
    p "#{winner.name} is safe!"
    #below works, putting an object into brackets then subtracting
    @participants -= [winner] unless winner.nil?
  end

  def give_turn_to(player)
    #this method will throw dice, generate_combo
    result = player.throw_dice
    p "#{player.name} got #{result}"
    #debugger
    player.get_hand(result)
  end

  def confirm_play
    p "Play next round? Type 'yes'!"
    answer = gets.chomp
    until answer == 'yes'
      p "Play next round? Type 'yes'!"
      answer = gets.chomp
    end
  end

  def score
    #BIG MISS, want to copy people still playing into a new array to fiddle around with
    candidates = @participants.dup

    ##this returns one of three options
    #ONE at least one of the candidates must have a ace
    candidates.select! { |player| player.hand[:ace] == true }
    return nil if candidates.empty?

    #TWO returns player with highest matches for dice type
    most_matches = 0
    candidates.each do |player|
      if player.hand[:frequency] > most_matches
        most_matches = player.hand[:frequency]
      end
    end

    candidates.select! do |player|
      player.hand[:frequency] == most_matches
    end

    return candidates.first if candidates.count == 1

    #THREE returns the player with highest dice number
    candidates.sort do | p1, p2 |
      p1.hand[:most_freq] <=> p2.hand[:most_freq]
    end.last #calling a method like so is ok as long as its and object
  end

end


#note for this block of code
#create this so that if this file is run in a ruby program in the terminal
#nothing to do with pry
if $0 == __FILE__ #this is the short form
  p 'Enter player one name'
  p1 = Player.new(gets.chomp)
  p 'Enter player two name'
  p2 = Player.new(gets.chomp)
  p 'Enter player three name'
  p3 = Player.new(gets.chomp)
  p 'Enter player four name'
  p4 = Player.new(gets.chomp)
  p 'Enter player five name'
  p5 = Player.new(gets.chomp)
  game = BarDice.new(p1, p2, p3, p4, p5)
  game.play
end
