# class for the computer player methods and variables

class ComputerPlayer
  def initialize
    @possible_codes = generate_all_codes
    @all_codes = generate_all_codes
    @game_board = GameBoard.new
  end

  def create_code
    @code = Array.new(4) { rand(1...6) }.join.split('')
    @code
  end

  def guess_code(guess_count)
    # random code generator, started w/ this, prob can delete
    # @guess = Array.new(4) { rand(1...6) }.join.split('')
    puts "Guess #{guess_count}: please input four digits (1-6)"
    @possible_codes.delete(@guess)
    @guess = if guess_count == 1
               %w[1 1 2 2]
             else
               @possible_codes[0]
             end
  end

  def eliminate_codes_correct_position(exact_matches, number_matches)
    temp_possible_codes = []
    @possible_codes.clone.each_with_index do |all_code, _i|
      @possible_codes.clone.each_with_index do |compare_code, _j|
        exact = @game_board.correct_positions(all_code, compare_code)
        number = @game_board.correct_numbers(all_code)
        temp_possible_codes.push(compare_code) if exact == exact_matches && number == number_matches
      end
    end
    @possible_codes = temp_possible_codes.uniq
  end

  # def correct_positions(code, guess)
  #   correct_position = 0
  #   guess.each_index do |i|
  #     correct_position += 1 if guess[i] == code[i]
  #   end
  #   correct_position
  # end

  # def correct_numbers(code, guess)
  #   correct_number = 0
  #   guess.each_index do |i|
  #     correct_number += 1 if code.include?(guess[i])
  #   end
  #   correct_number
  # end

  def eliminate_codes_correct_number; end

  def generate_all_codes
    numbers = ['1', '2', '3', '4', '5', '6']
    @possible_codes = numbers.repeated_permutation(4).to_a
    @possible_codes
  end
end
