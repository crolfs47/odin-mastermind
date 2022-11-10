# class for the computer player methods and variables

class ComputerPlayer
  def initialize
    
  end

  def guess_code
  end

  def create_code
    @code = Array.new(4) { rand(1...6) }.join.split('')
    @code
  end
end
