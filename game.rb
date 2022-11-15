# game class initializes the game and manages the other mastermind classes

require_relative 'human_player'
require_relative 'computer_player'
require_relative 'game_board'

class Game
  def initialize
    @guess_count = 1
    @game_over = false
    @game_board = GameBoard.new
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

  # evaluates how correct guess is, gives hint
  def evaluate_guess(code, guess)
    temp_code = code.clone
    temp_guess = guess.clone
    @exact_matches = @game_board.correct_positions(temp_code, temp_guess)
    @number_matches = @game_board.correct_numbers(temp_code, temp_guess)
    give_hint(@exact_matches, @number_matches)
    @player1.eliminate_codes_correct_position(@exact_matches,@number_matches)
    

    # # Stores hint as an array, not sure if I'll need this
    # @hint = ['X'] * @exact_match + ['O'] * @number_match
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
