=begin
tic tac toe is a 2 player board game played on a 3x3 grid. Player take turns marking
a square. The first player to mark 3 squares in a row wins

nouns - board, player, square grid
verb - mark, play

Board
Square
Player
- mark
- play
 ommited grid as board and grid mean the same
=end
require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + #cols
                  [[1, 5, 9], [3, 5, 7]] # diag

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+------"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+------"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  def []=(pos, marker)
    @squares[pos].marker = marker
  end

  def unmarked_keys
    @squares.select {|_, sq| sq.unmarked? }.keys # array is returned
  end

  def full?
    unmarked_keys.empty? # if array is empty => brd is full
  end

  def someone_won? # should return a boolean
    !!winning_marker
  end

  # def count_human_marker(squares)
  #   squares.count {|sq| sq.marker == TTTGame::HUMAN_MARKER }
  # end

  # def count_computer_marker(squares)
  #   squares.count {|sq| sq.marker == TTTGame::COMPUTER_MARKER }
  # end

  def mark_counter(squares)
    if !squares.any? {|sq| sq.marker == Square::INITIAL_MARKER }
      mark = squares[0].marker
      return squares.all? { |sq| mark == sq.marker }
    end
  end

  def winning_marker # should return winning marker or nil
    WINNING_LINES.each do |line|
      if mark_counter(@squares.values_at(*line))
        return @squares[line[0]].marker
      end
    end
    nil
  end

  def reset
    (1..9).each {|key| @squares[key] = Square.new}
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end

end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

    def play
    clear
    display_welcome_message
    loop do
      # display_board(clear_screen: false)
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
    clear
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to tic tac toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thank you for playing tic tac toe. Good Bye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

    def display_board
    puts "You are #{human.marker}. Computer is #{computer.marker}:"
    puts ""
    board.draw
    puts ""
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "computer won!"
    else
      puts "It is a tie"
    end
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}) "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Please choose a valid number"
    end
    board[square] = human.marker
  end

  def computer_moves
    square = board.unmarked_keys.sample
    board[square] = computer.marker
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts " Please choose 'y' or 'n'"
    end
    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end
end

ttt = TTTGame.new
ttt.play