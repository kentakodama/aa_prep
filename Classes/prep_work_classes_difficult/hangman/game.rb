class Hangman
  MAX_GUESSES = 8

  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @num_remaining_guesses = MAX_GUESSES
  end

  def play
    setup

    while @num_remaining_guesses > 0
      p @board
      take_turn

      if won?
        p @board
        puts "Guesser wins!"
        return
      end
    end

    puts "Word was: #{@referee.require_secret}"
    puts "Guesser loses!"

    nil
  end

  def setup
    secret_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_length)
    @board = [nil] * secret_length
  end

  def take_turn
    guess = @guesser.guess(@board)
    indices = @referee.check_guess(guess)
    update_board(guess, indices)
    @num_remaining_guesses -= 1 if indices.empty?

    @guesser.handle_response(guess, indices)
  end

  def update_board(guess, indices)
    indices.each { |index| @board[index] = guess }
  end

  def won?
    @board.all?
  end
end


if __FILE__ == $PROGRAM_NAME
  # use print so that user input happens on the same line
  print "Guesser: Computer (yes/no)? "
  if gets.chomp == "yes"
    guesser = ComputerPlayer.player_with_dict_file("dictionary.txt")
  else
    guesser = HumanPlayer.new
  end

  print "Referee: Computer (yes/no)? "
  if gets.chomp == "yes"
    referee = ComputerPlayer.player_with_dict_file("dictionary.txt")
  else
    referee = HumanPlayer.new
  end

  Hangman.new({guesser: guesser, referee: referee}).play
end
