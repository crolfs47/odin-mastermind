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
    @guess = @human_player.player_guess
    @guess_count += 1
    check_guess
  end

  # checks if guess is correct or out of guesses, otherwise calls to evaluate the guess
  def check_guess
    if @guess == @code
      @game_over = true
      puts 'You win'
    elsif @guess_count > 10
      @game_over = true
      puts 'Out of guesses, you lose!'
    else
      evaluate_guess
    end
  end

  # evaluates how correct guess is, gives hint
  def evaluate_guess
    correct_position = 0
    correct_number = 0
    @guess.each_with_index do |num, i|
      if @guess[i] == @code[i]
        correct_position += 1
      elsif @code.include?(num)
        correct_number += 1
      end
    end
    @hint = ['X'] * correct_position + ['O'] * (correct_number - correct_position)
    p @hint
  end

end
