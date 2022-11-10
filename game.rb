# game class initializes the game and manages the other mastermind classes

require_relative 'human_player'
require_relative 'computer_player'

class Game
  def initialize
    @guess_count = 1
    @game_over = false
    @human_player = HumanPlayer.new
    @computer_player = ComputerPlayer.new
    # @hint = []
    puts 'Welcome to Mastermind!'
  end

  def play_game
    choose_role
    @code = @computer_player.create_code
    p @code
    take_turn until @game_over
  end

  def take_turn
    puts "Guess #{@guess_count}: please input four digits (1-6)"
    @guess = @human_player.guess_code
    @guess_count += 1
    check_guess
  end

  def choose_role
    puts 'Do you want to be the codemaker or codebreaker? Input 1 for codemaker or 2 for codebreaker'
    role = gets.chomp
    p role
    return role if role.match(/^[1-2]$/)
    puts 'Please input only 1 or 2'
    choose_role
  end
  
  def define_players

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

  # evaluates how correct guess is, gives hint
  # potentially split into two methods, or split out hint?
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

    correct_position
    correct_number

    # not using below (stores hint as array)
    # @hint = ['X'] * correct_position + ['O'] * correct_number

    # give hint (new method?)
    print 'Hint: '
    correct_position.times {print 'X'}
    correct_number.times {print 'O'}
    puts ''
  end

end
