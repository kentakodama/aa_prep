
class ComputerPlayer
  def self.player_with_dict_file(dict_file_name)
    ComputerPlayer.new(File.readlines(dict_file_name).map(&:chomp))
  end

  attr_reader :candidate_words

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample

    @secret_word.length
  end

  def check_guess(guess)
    response = []

    @secret_word.split("").each_with_index do |letter, index|
      response << index if letter == guess
    end

    response
  end

  def register_secret_length(length)
    # begining to play again; reset candidate_words
    @candidate_words = @dictionary.select { |word| word.length == length }
  end

  def guess(board)
    # I left this here so you can see it narrow things down.
    # p @candidate_words

    freq_table = freq_table(board)

    most_frequent_letters = freq_table.sort_by { |letter, count| count }
    letter, _ = most_frequent_letters.last

    # we'll never repeat a guess because we only look at unfilled
    # positions to calculate frequency, and we remove a word from the
    # candidates if it has a guessed letter in an unfilled position on
    # the board.
    letter
  end

  def handle_response(guess, response_indices)
    @candidate_words.reject! do |word|
      should_delete = false

      word.split("").each_with_index do |letter, index|
        if (letter == guess) && (!response_indices.include?(index))
          should_delete = true
          break
        elsif (letter != guess) && (response_indices.include?(index))
          should_delete = true
          break
        end
      end

      should_delete
    end
  end

  def require_secret
    @secret_word
  end

  private
  def freq_table(board)
    # this makes 0 the default value; see the RubyDoc.
    freq_table = Hash.new(0)
    @candidate_words.each do |word|
      board.each_with_index do |letter, index|
        # only count letters at missing positions
        freq_table[word[index]] += 1 if letter.nil?
      end
    end

    freq_table
  end
end
