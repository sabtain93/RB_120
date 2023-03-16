# All bonus features added
class Rock
  attr_reader :name

  def initialize
    @name = 'rock'
  end
end

class Paper
  attr_reader :name

  def initialize
    @name = 'paper'
  end
end

class Scissor
  attr_reader :name

  def initialize
    @name = 'scissor'
  end
end

class Lizard
  attr_reader :name

  def initialize
    @name = 'lizard'
  end
end

class Spock
  attr_reader :name

  def initialize
    @name = 'spock'
  end
end

class Move
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def self.move_history

  end


  def >(other_value)
    if value.name == 'rock'
      return true if other_value.value.name == 'scissor' || other_value.value.name == 'lizard'
      return false
    elsif value.name == 'paper'
      return true if other_value.value.name == 'rock' || other_value.value.name == 'spock'
      return false
    elsif value.name == 'scissor'
      return true if other_value.value.name == 'paper' || other_value.value.name == 'lizard'
      return false
    elsif value.name == 'spock'
      return true if other_value.value.name == 'scissor' || other_value.value.name == 'rock'
      return false
    elsif value.name == 'lizard'
      return true if other_value.value.name== 'spock' || other_value.value.name == 'paper'
      return false
    end
  end

  def to_s
    value.name
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
  attr_accessor :human_moves

  def initialize
    super()
    @human_moves = []
  end

  def set_name
    system "clear"
    n = ""
    loop do
      puts "Please Enter your name:"
      n = gets.chomp
      break unless n.empty?
      puts "Please enter a valid name!"
    end
    self.name = n.strip
    puts " "
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissor, spock, lizard"
      puts " "
      choice = gets.chomp
      puts " "
      break if ['rock', 'paper', 'scissor', 'spock', 'lizard'].include? choice
      puts "Invalid choice!"
    end
    @human_moves << choice
    case choice
    when "rock"
      self.move = Move.new(Rock.new)
    when "paper"
      self.move = Move.new(Paper.new)
    when "scissor"
      self.move = Move.new(Scissor.new)
    when 'spock'
      self.move = Move.new(Spock.new)
    when 'lizard'
      self.move = Move.new(Lizard.new)
    end
  end

end

class Computer < Player
  attr_accessor :comp_moves

  def initialize
    super()
    @comp_moves = []
  end

  def set_name
    self.name = ['R2D2', 'iROBOT', 'D24X'].sample
  end

  def choose
    choice = nil
    case name
    when "R2D2"
     self.move = Move.new([Rock.new, Spock.new, Lizard.new].sample)
     self.comp_moves << move.to_s
    when "iROBOT"
      self.move = Move.new([Paper.new, Scissor.new].sample)
      self.comp_moves << move.to_s
    when "D24X"
      self.move = Move.new([Rock.new, Paper.new, Scissor.new].sample)
      self.comp_moves << move.to_s
    end
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "#{human.name} welcome to Rock, Paper, scissor, spock, lizard game!"
    puts "You will be playing against #{computer.name}. GOOD LUCK!"
    puts " "
    puts "The One to score 3 points wins the game!"
    puts " "
  end

  def display_goodbye_message
    puts "Thank you! for playing Rock, Paper, Scissors, Spock, Lizard. Good Bye!"
  end

 # rubocop: disable Metrics/MethodLength
  def display_score
    system "clear"
    puts " "
    puts "------------SCORE BOARD------------"
    print "#{human.name} moves : "
    p human.human_moves
    puts "#{human.name} score -> #{human.score}"
    puts " "
    print "#{computer.name} moves: "
    p computer.comp_moves
    puts "#{computer.name} score -> #{computer.score}"
    puts "-------------------------------------"
    puts " "
  end

  def reset
    human.human_moves = []
    computer.comp_moves = []
    human.score = 0
    computer.score = 0
  end

  def display_winner
      # puts "#{human.name} chose #{human.move}"
      puts "#{computer.name} chose #{computer.move}"
      puts " "

      if human.move > computer.move
        human.score += 1
        puts "#{human.name} won this round"
        sleep(3)
        display_score
      elsif computer.move > human.move
        computer.score += 1
        puts "#{computer.name} won this round"
        sleep(3)
        display_score
      else
        puts "Nobody won this round it's a tie"
        sleep(3)
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
    system "clear"
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      if human.score == 3 || computer.score == 3
        sleep(3)
        system "clear"
        break unless play_again?
        reset
      end
    end
    system "clear"
    display_goodbye_message
  end
end


RPSGame.new.play