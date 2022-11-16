# game class initializes the game and manages the other mastermind classes

require_relative 'human_player'
require_relative 'computer_player'
require_relative 'hint_calculator'

class Game
  def initialize
    @guess_count = 1
    @game_over = false
    @hint_calculator = HintCalculator.new
    puts 'Welcome to Mastermind!'
  end

  def play_game
    define_players
    @code = @player2.create_code
    p @code
    puts ''
    take_turn until @game_over
  end

  def choose_role
    puts 'Do you want to be the codebreaker or codemaker?'
    puts 'Input 1 for codebreaker or 2 for codemaker'
    role = gets.chomp
    return role if role.match(/^[1-2]$/)

    puts 'Please input only 1 or 2'
    choose_role
  end
  
  # player 1 is the codebreaker, player 2 is the codemaker
  def define_players
    role_choice = choose_role
    if role_choice == '1'
      @player1 = HumanPlayer.new
      @player2 = ComputerPlayer.new
    elsif role_choice == '2'
      @player1 = ComputerPlayer.new
      @player2 = HumanPlayer.new
    end
  end

  def take_turn
    @guess = @player1.guess_code(@guess_count)
    puts ''
    puts "Guess: #{@guess.join('')}"
    @guess_count += 1
    check_guess
  end

  # checks if guess is correct or out of guesses, otherwise calls to evaluate the guess
  def check_guess
    if @guess == @code
      @game_over = true
      puts 'Correct, codebreaker wins!'
    elsif @guess_count > 10
      @game_over = true
      puts 'Out of guesses, codebreaker loses!'
    else
      evaluate_guess(@code, @guess)
    end
  end

  # evaluates how correct guess is, gives hint, calls computer player algorithm
  def evaluate_guess(code, guess)
    @exact_matches = @hint_calculator.correct_positions(code, guess)
    @number_matches = @hint_calculator.correct_numbers(code)
    give_hint(@exact_matches, @number_matches)
    @player1.evaluate_hint(@exact_matches, @number_matches)
  end
  
  def give_hint(exact_matches, number_matches)
    print 'Hint: '
    exact_matches.times {print 'X'}
    number_matches.times {print 'O'}
    puts ''
    puts 'X means you have one correct number in the correct location'
    puts 'O means you have one correct number in the wrong location'
    puts ''
  end

end
