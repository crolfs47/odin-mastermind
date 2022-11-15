class GameBoard
  def correct_positions(code, guess)
    correct_position = 0
    guess.each_index do |i|
      next unless guess[i] == code[i]

      correct_position += 1
      code[i] = '*'
      guess[i] = '*'
    end
    correct_position
  end

  def correct_numbers(code, guess)
    correct_number = 0
    guess.each_index do |i|
      next unless guess[i] != '*' && code.include?(guess[i])

      correct_number += 1
      code[code.find_index(guess[i])] = 'x'
      guess[i] = 'x'
    end
    correct_number
  end
  
end
