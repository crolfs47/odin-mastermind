# class for the human player methods and variables
# make guess, make code (next), get name?

class HumanPlayer
  def initialize; end

  def guess_code(guess_count)
    puts "Guess #{guess_count}: please input four digits (1-6)"
    guess_input = gets.chomp
    if guess_input.count('^1-6').zero? && guess_input.length == 4
      @guess = guess_input.split('')
    else
      puts 'Please input exactly four valid digits, 1-6'
      guess_code
    end
    @guess
  end

  def create_code
    puts 'Please input your secret code, it must be four digits (1-6) '
    code_input = gets.chomp
    if code_input.count('^1-6').zero? && code_input.length == 4
      @code = code_input.split('')
    else
      puts 'Please input exactly four valid digits, 1-6'
      create_code
    end
    @code
  end

  # doesn't do anything, only need for computer player
  def evaluate_hint(exact_matches, number_matches)
  end
  
end
