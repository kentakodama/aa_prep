class Fixnum

  NUMBERS = {0 => 'zero',
   1 => 'one',
   2 => 'two',
   3 => 'three',
   4 => 'four',
   5 => 'five',
   6 => 'six',
   7 => 'seven',
  8 => 'eight',
   9 => 'nine',
   10 => 'ten',
   11 => 'eleven',
   12 => 'twelve',
   13 => 'thirteen',
   14 => 'fourteen',
   15 => 'fifteen',
   16 => 'sixteen',
   17 => 'seventeen',
   18 => 'eighteen',
   19 => 'nineteen',
   20 => 'twenty',
   30 => 'thirty',
   40 => 'forty',
   50 => 'fifty',
   60 => 'sixty',
   70 => 'seventy',
   80 => 'eighty',
   90 => 'ninety'
   }

  def in_words
    return NUMBERS[self] if self.between?(0, 9)
    sets_of_three = []
    digits = self.to_s.split('')

    until digits.length == 0
      sets_of_three.unshift(digits.pop(3).join('').to_i)
    end
# PROBLEM IS SOMEWHERE HERE
     #in order to go from ones

    answer = []
    units = [nil, 'thousand', 'million', 'billion', 'trillion']
    until sets_of_three.length == 0
      unit = units.shift
      words = low_numbers(sets_of_three.pop)
      answer.unshift(unit) unless unit == nil || words == ''
      answer.unshift(words) unless words == ''
    end

    answer.join(' ')

  end


   def low_numbers(num=nil)
     return '' if num == nil || num == 0
     hundreds = nil
     tens = nil
     singles = nil
     if num >= 100
       hundreds = num / 100
     end

     if (num % 100).between?(11, 19)
       tens = num % 100
     elsif (num % 100) >= 20
         tens = (num % 100) - (num % 10)
         if num % 10 != 0
           singles = num % 10
         end
     elsif num % 10 != 0
       singles = num % 10
     elsif num == 10
        singles = 10
     end

     results = []
     results << "#{NUMBERS[hundreds]} hundred" unless hundreds == nil
     results << "#{NUMBERS[tens]}" unless tens == nil
     results << "#{NUMBERS[singles]}" unless singles == nil
     return results.join(' ') unless results.length == 1

     results[0]

   end

end
