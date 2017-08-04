class Code

  #this class generates, converts strings into code and compares the codes, and returns matches or near matches

  attr_accessor :pegs

  COLORS = {
    'r' => :RED,
    'b' => :BLUE,
    'y' => :YELLOW,
    'g' => :GREEN,
    'p' => :PURPLE,
    'o' => :ORANGE
  }

  def initialize(code)
    @pegs = code
  end
  # code instance contains pegs array that is series of capital letters
  def self.generate_random
    random = []
    4.times {random << COLORS.values.sample}
    Code.new(random)
  end

  def self.generate_guess(guess_string)
    guess = []
    guess_string.each_char do |char|
      guess << COLORS[char.downcase]
    end
    Code.new(guess)
  end

  def self.valid_guess?(guess_string)
    return false if guess_string.length != 4
    guess_string.downcase.split('').all? do |letter|
      COLORS.key?(letter)
    end
  end


  def ==(other_code)
    self.pegs == other_code.pegs
  end

  def report_matches(guess)
    exact_matches = exact_matches(guess)
    p "You guessed the correct position(s) of #{exact_matches}"
    near_matches = near_matches(guess)
    p "#{near_matches} of your guesses are in the secret_code"
  end

  def exact_matches(guess)
    count = 0
    @pegs.each_index { |i| count += 1 if @pegs[i] == guess.pegs[i] }
    count
  end

  def near_matches(guess)
    count = 0
    unique_colors = guess.pegs.uniq
    unique_colors.each do |color|
      count += 1 if @pegs.uniq.count(color) > 0
    end
    count
  end

end
