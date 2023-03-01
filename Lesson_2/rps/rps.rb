class Move
  VALUES = ['rock', 'paper', 'scissor', 'spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissor?
    @value == 'scissor'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_value)
    if rock?
      return true if other_value.scissor? || other_value.lizard?
      return false
    elsif paper?
      return true if other_value.rock? || other_value.spock?
      return false
    elsif scissor?
      return true if other_value.paper? || other_value.lizard?
      return false
    elsif spock?
      return true if other_value.scissor? || other_value.rock?
      return false
    elsif lizard?
      return true if other_value.spock? || other_value.paper?
      return false
    end
  end

  # def <(other_value)
  #   if rock?
  #     return true if other_value.paper?
  #     return false
  #   elsif paper?
  #     return true if other_value.scissor?
  #     return false
  #   elsif scissor?
  #     return true if other_value.rock?
  #     return false
  #   end
  # end

  def to_s
    @value
  end
end


class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "Please Enter your name:"
      n = gets.chomp
      break unless n.empty?
      puts "Please enter a valid name!"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose one from the list #{Move::VALUES}"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Invalid choice!"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'iROBOT', 'D24X', 'DELL', 'HP'].sample
  end

  def choose
     self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, scissor, spock, lizard game!"
  end

  def display_goodbye_message
    puts "Thank you! for playing Rock, Paper, Scissors, Spock, Lizard. Good Bye!"
  end

  def display_score
    puts "#{human.name} -> #{human.score}"
    puts "#{computer.name} -> #{computer.score}"
  end

  def display_winner
      puts "#{human.name} chose #{human.move}"
      puts "#{computer.name} chose #{computer.move}"

      if human.move > computer.move
        # puts "#{human.name} won!"
        human.score += 1
        display_score
      elsif computer.move > human.move
        # puts "#{computer.name} won!"
        computer.score += 1
        display_score
      else
        puts "It's a tie"
        display_score
      end
      puts "#{human.name} won!" if human.score == 3
      puts "#{computer.name} won!" if computer.score == 3
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? y/n"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Please enter 'y' or 'n'!"
    end
    return true if answer.downcase == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      if human.score == 3 || computer.score == 3
        break unless play_again?
      end
    end
    display_goodbye_message
  end
end


RPSGame.new.play
