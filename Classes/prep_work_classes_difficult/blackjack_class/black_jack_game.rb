require_relative 'ComputerPlayer'
require_relative 'Human_player'
require 'byebug'

class Blackjack

  SUITS = ["H", "C", "S", "D"]
  CARDNUMBER = %w[A 2 3 4 5 6 7 8 9 10 J Q K] #this creates array of strings with spaces

  FACECARDS = {
    "A" => 11,
    "J" => 10,
    "Q" => 10,
    "K" => 10
    }

  attr_accessor :all_players, :dealt_cards

  def initialize(*players)
    @all_players = players
    @dealt_cards = []
  end

  def play
    setup
    @all_players.each do |player|
      until player.bust? || player.hold
        take_turn(player)
        p "Bust! You have #{player.total}." if player.bust?
      end
    end
    compare_hands
  end

  def setup
    @all_players.each { |player| deal(player, 2) }
  end

  def take_turn(player)
    move = player.get_move
    if move == "hit"
      deal(player, 1)
    elsif move == "hold"
      debugger
      player.hold = true
    end
  end

  def deal(player, num_cards)
    num_cards.times do

      card = random_card

      until new_card?(card) #here
        card = random_card
      end

      player.hand[card] = value(card)
      @dealt_cards << card
    end
  end

  def random_card
    number = CARDNUMBER.sample
    suit = SUITS.sample
    "#{number}#{suit}"
  end

  def new_card?(card)
    return true unless @dealt_cards.include?(card)
    false
  end

  def value(card)
    face_value = card.chop
    #to_sym and to_s only works between strings and symbols cant convert symbol to number
    if FACECARDS.key?(face_value) #key? method same as has_key?
      FACECARDS[face_value] #ok to implicitly return when last eval in method
    else
      face_value.to_i
    end
  end

  def score_hands
    scores = Hash.new
    @all_players.each do |player|
      scores[player] = player.total unless player.bust?
    end
    scores
  end

  def compare_hands
    scores = score_hands
    if scores.empty?
      'No winner'
    elsif tie?(scores)
      winner = break_tie(scores)
      "#{winner.name} wins with #{winner.total}!"
    else
      winner = scores.max_by { |_player, score| score }[0]
      "#{winner.name} wins with #{winner.total}!"
    end #block args start with underscore if not used after

  end

  def tie?(score_hash)

    highest_score = score_hash.values.max
    return true if score_hash.values.count(highest_score) > 1
    false
  end

  def break_tie(scores_hash)
    #get winning player by comparing the highest car
    scores_hash.keys.reduce do |highest_card_holder, player|
      if player.hand.values.max > highest_card_holder.hand.values.max
        highest_card_holder = player
      else
        highest_card_holder
      end
    end

  end

  def restart
    #for each player
    @all_players.each do |player|
      player.hand = {}
      player.hold = false
    end
    @dealt_cards = []
    play
  end

end

if __FILE__ == $PROGRAM_NAME
  p "Please enter player one's name"
  player1 = HumanPlayer.new(gets.chomp)
  p "Please enter player two's name"
  player2 = HumanPlayer.new(gets.chomp)
  player3 = ComputerPlayer.new
  game = Blackjack.new(player1, player2, player3)
  game.play
end
