# class for the human player methods and variables
# make guess, make code (next), get name?

class HumanPlayer
  def initialize; end

  def player_guess
    guess_input = gets.chomp
    if guess_input.count('^1-6').zero? && guess_input.length == 4
      @guess = guess_input.split('')
      p @guess
    else
      puts 'Please input exactly four valid digits, 1-6'
    end
    @guess
  end
end
