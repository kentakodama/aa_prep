class RPNCalculator
  # each element is added one at a time
  # performs operation on last two digits
  #need to slice from index of two nums and operation three total
  attr_accessor :calculator

  def initialize
    @calculator = []
  end

  def value
    @calculator.last
  end

  #must create a push method for RPNCalculator class
  # Everything that acts on an instance of RPNCalculator class must be defined with class
  # even though there is an array stored within that class
  def push(num)
    @calculator << num
  end
  #must have plus minus times divide
  def plus
    #****** THIS IS THE ERROR IT WILL RAISE IN REPL
    raise "calculator is empty" if @calculator.length < 2
    @value = @calculator[-2] + @calculator[-1]
    @calculator.pop(2)
    @calculator << @value
  end

  def minus
    raise "calculator is empty" if @calculator.length < 2
    @value = @calculator[-2] - @calculator[-1]
    @calculator.pop(2)
    @calculator << @value
  end

  def times
    raise "calculator is empty" if @calculator.length < 2
    @value = @calculator[-2] * @calculator[-1]
    @calculator.pop(2)
    @calculator << @value
  end

  def divide
    raise "calculator is empty" if @calculator.length < 2
    @value = @calculator[-2].fdiv(@calculator[-1])
    @calculator.pop(2)
    @calculator << @value
  end

  def tokens(string)
    @calc_input = []
    string.split(' ').each do |char|
      if char.to_i.to_s == char
        @calc_input << char.to_i
      elsif ('+-*/').include? char
        @calc_input << char.to_sym
      end
    end
    @calc_input
  end

  def evaluate(string)
    @tokenized = tokens(string)
    @tokenized.each do |char|
      if char.is_a? Numeric
        push(char)
      elsif char == :+
        plus
      elsif char == :-
        minus
      elsif char == :*
        times
      elsif char == :/
        divide
      end
    end
    value
  end
end


calc = RPNCalculator.new
calc.push(3)
calc.push(4)
p calc.calculator
