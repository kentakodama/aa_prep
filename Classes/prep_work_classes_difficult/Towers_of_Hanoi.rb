
class TowersOfHanoi
  #PLAYABLE VERSION

  #notes
  # have an attr_reader to check after each turn
  # valid move includes: no move empty tower, moving larger disk on towers_of_hanoi_spec
  #valid_move? true false
  #create won? method return true or false
  #moves should be inputed as array of arrays

  attr_reader :towers

  def render
    p @towers
  end

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def valid_move?(from_tower, to_tower)
    # return false if !from_tower.is_a? Numeric
    # return false if to_tower.class != Integer
    return false if !from_tower.between?(0, 2) || !to_tower.between?(0, 2)
    return false if @towers[from_tower].empty?
    return false if from_tower == to_tower
    @piece = @towers[from_tower].last
    #note: any? is not the same as !empty?
    return false if !@towers[to_tower].empty? && @piece >= @towers[to_tower].last
    true
  end

  def move

    p "Please select which tower to move a piece from 1, 2, 3"
      @from_tower = gets.chomp.to_i - 1
    p "Please select which tower to move your piece to"
      @to_tower = gets.chomp.to_i - 1

    until valid_move?(@from_tower, @to_tower)
      p "Not valid"
      render
      p "Please select which tower to move a piece from 1, 2, 3"
      @from_tower = gets.chomp.to_i - 1
      p "Please select which tower to move your piece to"
      @to_tower = gets.chomp.to_i - 1
    end

    @piece = @towers[@from_tower].pop
    @towers[@to_tower] << @piece
    render
  end

  def winner_message
    p "Congratulations! You won!"
  end

  def play
    p 'Get ready!'
    render
    while true
      move
      break if @towers[1].length == 3 || @towers[2].length == 3
    end
    winner_message
  end

end

if $0 == __FILE__

  game = TowersOfHanoi.new
  game.play

end
