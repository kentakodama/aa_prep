

class GameNode

  def initialize(board, mark)
    @board = board
    @current_mark = mark
  end

  def end?
    @board.over?
  end


end

class GameStateTree

  def initialize(board = Board.new)
    @root_state = GameNode.new(board, :X)
  end

  def end_states
    queue = [@root_state]
    result = Hash.new
    until queue.empty?

    end
    result
  end

end
