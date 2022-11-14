# class for the computer player methods and variables

require_relative 'game'

class ComputerPlayer
  # attr_reader :guess_count, :exact_match, :number_match

  def initialize
    @possible_codes = []
  end

  def create_code
    @code = Array.new(4) { rand(1...6) }.join.split('')
    @code
  end

  def guess_code(guess_count)
    # random code generator, started w/ this, prob can delete
    # @guess = Array.new(4) { rand(1...6) }.join.split('')
    
    @guess = ['1', '1', '2', '2']
    
    
  end

  def eliminate_codes_correct_position
  end

  def eliminate_codes_correct_number
  end

  def generate_all_codes
    numbers = [1, 2, 3, 4, 5, 6]
    @possible_codes = numbers.permutation(4).to_a
    @possible_codes
  end
end
