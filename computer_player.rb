# class for the computer player methods and variables

require_relative 'game_board'

class ComputerPlayer
  def initialize
    @possible_codes = generate_all_codes
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
    if guess_count == 1
      @guess = ['1', '1', '2', '2']
    else
      p @possible_codes
      @guess = @possible_codes[0]
    end
             
  end

  def eliminate_codes_correct_position(exact_matches, number_matches)
    @possible_codes.each_with_index do |possible_code, i|
      exact = @game_board.correct_positions(possible_code.clone, @guess.clone)
      number = @game_board.correct_numbers(possible_code.clone, @guess.clone)
      @possible_codes.delete_at(i) if exact_matches <= exact
    end
  end

  def eliminate_codes_correct_number; end

  def generate_all_codes
    numbers = ['1', '2', '3', '4', '5', '6']
    @possible_codes = numbers.repeated_permutation(4).to_a
    @possible_codes
  end
end
