
require_relative 'code'

class Mastermind


  def initialize(code = Code.generate_random)
    @secret_code = code
  end

  def play
    @win = false # instead of trying to be super complicated, initialize @win as false here 1) to use in over? and 2) to use in message eventually
    @turns_left = 10
    until over?
      play_turn
    end
    @win ? winner_message : loser_message 
  end

  def over?
    @win || @turns_left == 0
  end


  def play_turn
    p "You have #{@turns_left} turns left!"
    p "Enter a four letter guess!"
    guess = gets.chomp
    until Code.valid_guess?(guess)
      p "You may only choose from red, blue, yellow, green, purple, and orange"
      guess = gets.chomp
    end
    @guess = Code.generate_guess(guess)
    @win = true if match?(@guess)
    @secret_code.report_matches(@guess)
    @turns_left -= 1
  end

  def match?(guess)
    @secret_code==(guess)
  end

  def winner_message
    p "Congrats! you win!"
  end

  def loser_message
    p "You lose boss"
  end

end

if $0 == __FILE__
  game = Mastermind.new
  game.play
end
