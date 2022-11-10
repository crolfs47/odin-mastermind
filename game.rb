# game class initializes the game and manages the other mastermind classes

require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game
  def initialize
    @code = ['6', '4', '4', '2']
    @guess_count = 1
    @game_over = false
    @human_player = HumanPlayer.new
    @hint = []
    puts 'Welcome to Mastermind!'
  end

  def play_game
    take_turn until @game_over
  end

  def take_turn
    puts "Guess #{@guess_count}: please input four digits (1-6)"
    @guess = @human_player.guess_code
    @guess_count += 1
    check_guess
  end

  # checks if guess is correct or out of guesses, otherwise calls to evaluate the guess
  def check_guess
    if @guess == @code
      @game_over = true
      puts 'You win!'
    elsif @guess_count > 10
      @game_over = true
      puts 'Out of guesses, you lose!'
    else
      evaluate_guess
    end
  end

  # evaluates how correct guess is, gives hint - potentially split into two methods?
  def evaluate_guess
    correct_position = 0
    correct_number = 0
    temp_code = @code.clone
    temp_guess = @guess.clone

    @guess.each_index do |i|
      if @guess[i] == @code[i]
        correct_position += 1
        temp_code[i] = '*'
        temp_guess[i] = '*'
      end
    end

    temp_guess.each_index do |i|
      if temp_guess[i] != '*' && temp_code.include?(temp_guess[i])
        correct_number += 1
        temp_code[temp_code.find_index(temp_guess[i])] = 'x'
        temp_guess[i] = 'x'
      end
    end

    # decide what format to use for hint below (store as array or just print X/O)
    @hint = ['X'] * correct_position + ['O'] * correct_number

    correct_position.times {print 'X'}
    correct_number.times {print 'O'}
    puts ''
  end

end
