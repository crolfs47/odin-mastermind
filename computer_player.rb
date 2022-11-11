# class for the computer player methods and variables

class ComputerPlayer
  def initialize
    @possible_codes = []
  end

  def guess_code
    @guess = Array.new(4) { rand(1...6) }.join.split('')
    @guess
  end

  def create_code
    @code = Array.new(4) { rand(1...6) }.join.split('')
    @code
  end

  def generate_all_codes
    numbers = [1, 2, 3, 4, 5, 6]
    @possible_codes = numbers.permutation(4).to_a
    @possible_codes
  end
end
