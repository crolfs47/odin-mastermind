# class for the computer player methods and variables

class ComputerPlayer
  def initialize
    @possible_codes = generate_all_codes
    @all_codes = generate_all_codes
    @hint_calculator = HintCalculator.new
  end

  def create_code
    @code = Array.new(4) { rand(1...6) }.join.split('')
    @code
  end

  def guess_code(guess_count)
    puts "Guess #{guess_count}: please input four digits (1-6)"
    @possible_codes.delete(@guess)
    @guess = if guess_count == 1
               %w[1 1 2 2]
             else
               @possible_codes[0]
             end
  end

  def evaluate_hint(exact_matches, number_matches)
    temp_possible_codes = []
    @possible_codes.clone.each_with_index do |all_code, _i|
      @possible_codes.clone.each_with_index do |compare_code, _j|
        exact = @hint_calculator.correct_positions(all_code, compare_code)
        number = @hint_calculator.correct_numbers(all_code)
        temp_possible_codes.push(compare_code) if exact == exact_matches && number == number_matches
      end
    end
    @possible_codes = temp_possible_codes.uniq
  end

  def generate_all_codes
    numbers = ['1', '2', '3', '4', '5', '6']
    @possible_codes = numbers.repeated_permutation(4).to_a
    @possible_codes
  end
end
