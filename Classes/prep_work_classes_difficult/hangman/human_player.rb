class HumanPlayer
  def register_secret_length(length)
    puts "Secret is #{length} letters long"
  end

  def guess(board)
    p board
    puts "Input guess:"
    gets.chomp
  end

  def handle_response(guess, response)
    puts "Found #{guess} at positions #{response}"
  end

  def pick_secret_word
    puts "Think of a secret word; how long is it?"

    begin
      Integer(gets.chomp)
    rescue ArgumentError
      puts "Enter a valid length!"
      retry
    end
  end

  def check_guess(guess)
    puts "Player guessed #{guess}"
    puts "What positions does that occur at?"

    # didn't check for bogus input here; got lazy :-)
    gets.chomp.split(",").map { |i_str| Integer(i_str) }
  end

  def require_secret
    puts "What word were you thinking of?"
    gets.chomp
  end
end
