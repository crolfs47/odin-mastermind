# class to calculate correct positions and correct numbers in the wrong position

class HintCalculator
  def initialize
    @guess = []
    @code = []
  end

  def correct_positions(code, guess)
    temp_code = code.clone
    temp_guess = guess.clone
    correct_position = 0
    temp_guess.each_index do |i|
      next unless temp_guess[i] == temp_code[i]

      correct_position += 1
      temp_code[i] = '*'
      temp_guess[i] = '*'
    end
    @guess = temp_guess
    @code = temp_code
    correct_position
  end

  def correct_numbers(code)
    temp_code = @code.clone
    temp_guess = @guess.clone
    correct_number = 0
    temp_guess.each_index do |i|
      next unless temp_guess[i] != '*' && temp_code.include?(temp_guess[i])

      correct_number += 1
      temp_code[temp_code.find_index(temp_guess[i])] = 'x'
      temp_guess[i] = 'x'
    end
    correct_number
  end
  
end
