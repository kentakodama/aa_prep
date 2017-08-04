

require 'byebug'
require_relative 'human_player'

class Ghost

  GHOST = {
    0 => "G",
    1 => "H",
    2 => "O",
    3 => "S",
    4 => "T"
  }

  attr_accessor :p1, :p2, :current_player, :dictionary, :available_words, :letters

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @current_player = @p1
    @dictionary = create_dictionary
  end

  def create_dictionary
    file_lines = []
    File.foreach('dictionary.txt') { |line| file_lines << line.chomp}
    file_lines
  end

  def play_game
    until game_over?
      @available_words = @dictionary.dup
      # debugger
      play_round
      # debugger
      switch_players! unless round_over?
      assign_letter_to(@current_player)
      show_score
    end
    winner
  end

  def game_over?
    [@p1, @p2].any? {|player| player.tiles.join == "GHOST"}
  end

  def take_turn
    letter = @current_player.choose_letter
    until valid_input?(letter)
      p "Please Choose a Valid Input!"
      letter = @current_player.choose_letter
    end
    # debugger
    @letters << letter
    p @letters
    @available_words.select! do |word|
      word[0...@letters.length] == @letters.join("")
    end
  end

  def switch_players!
    @current_player = @current_player == @p1 ? @p2 : @p1
  end

  def show_score
    [@p1, @p2].each do |player|
      p "#{player.name} has #{player.tiles.to_s}"
    end
  end

  def play_round
    @letters = []
    until round_over?
      # debugger
      take_turn
      switch_players!
    end
  end

  def round_over?
    word_complete = @available_words.any? do |word|
      word == @letters.join("")
    end
    min_length = @letters.join("").length >= 4
    word_complete && min_length #split it up here because otherwise the conditional is too long
  end

  def assign_letter_to(player)
    leng = player.tiles.length
    player.tiles << GHOST[leng]
  end

  def valid_input?(letter)
    return false unless ('a'..'z').to_a.include?(letter)
    potential = (@letters + [letter]).join("")
    @available_words.any? {|word| word.include?(potential)}
  end

  def winner
    switch_players!
    name = @current_player.name
    p "#{name} won the game!"
  end

end

if $0 == __FILE__

  p1 = HumanPlayer.new("Kenta")
  p2 = HumanPlayer.new("Chris")
  game = Ghost.new(p1, p2)
  game.play_game

end
