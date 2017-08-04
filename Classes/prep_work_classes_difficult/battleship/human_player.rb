
class HumanPlayer

  def initialize(name='Kenta')
    @name = name
  end

  def get_input

    p 'tell me the coordinates you want to hit'
    pos = gets.chomp.split(',').map { |str| str.to_i  } #wow to_i automatically takes out spaces

    #make sure valid
    #
  end

end
