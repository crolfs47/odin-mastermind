# game class initializes the game and manages the other mastermind classes

require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game
  def initialize
    @code = ['6', '4', '4', '2']
    @guess_count = 1
    @game_over = false
    @human_player = HumanPlayer.new
    puts 'Welcome to Mastermind!'
  end

  def play_game
    take_turn until @game_over
  end

  def take_turn
    puts "Guess #{@guess_count}: please input four digits (1-6)"
    @guess = @human_player.player_guess
    @guess_count += 1
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
