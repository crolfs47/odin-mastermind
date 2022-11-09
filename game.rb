# game class initializes the game and manages the other mastermind classes

require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game
  def initialize
    @code = ['6', '4', '4', '2']
    @guess_count = 1
    @game_over = false
    puts 'Welcome to Mastermind!'
  end

  def play_game
    player_guess until @game_over
  end

  def player_guess
    puts "Guess #{@guess_count}: please input four digits (1-6)"
    guess_input = gets.chomp
    if guess_input.count('^1-6').zero? && guess_input.length == 4
      @guess = guess_input.split('')
      p @guess
      @guess_count += 1
    else
      puts 'Please input exactly four valid digits, 1-6'
    end
    check_if_game_over
  end

  def check_if_game_over
    if @guess_count > 10
      @game_over = true
      puts 'Out of guesses, you lose!'
    end
    if @guess == @code
      @game_over = true
      puts 'You win'
    end
  end
end
