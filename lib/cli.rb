$LOAD_PATH << File.join(File.dirname(__FILE__))
require 'game'
require 'board'
require 'human_player_cli'
require 'simple_computer'
require 'perfect_computer'

class CLI

  OFFSET = 1

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
    run_app
  end

  def select_board_size(options)
    get_valid_input(options)
  end

  def choose_player_type(options)
    get_valid_input(options)
  end

  def place_marker(options)
    offset_spaces = options.map {|space| space + OFFSET}
    get_valid_input(offset_spaces) - OFFSET
  end

  def get_valid_input(options)
    choice = @input.gets.chomp.to_i
    if options.include? choice
      choice
    else
      @output.puts "Invalid Selection"
      get_valid_input(options)
    end
  end

  private

  def run_app
    start_of_game
    until @game.game_over?
      single_turn
    end
    print_outcome
  end

  def start_of_game
    clear_screen
    print_welcome
    board = setup_board
    player_x = choose_player("X")
    player_o = choose_player("O")
    setup_game(board, player_x, player_o)
  end

  def single_turn
    clear_screen
    print_board
    print_players_turn
    @game.take_turn
  end

  def setup_board
    print_board_size
    choice = select_board_size([3,4])
    return Board.new(Array.new(choice * choice))
  end

  def choose_player(marker)
    clear_screen
    print_choose_player(marker)
    choice = choose_player_type([1,2,3])
    return HumanPlayer.new(marker, self) if choice == 1
    return SimpleComputer.new(marker) if choice == 2
    return PerfectComputer.new(marker) if choice == 3
  end

  def setup_game(board, player_x, player_o)
    @game = Game.new(board, player_x, player_o)
  end

  def print_welcome
    @output.puts "Tic Tac Toe"
  end

  def print_players_turn
    @output.puts "#{@game.current_player.marker}, take your turn"
  end

  def print_board
    board_split_into_rows = split_board_into_rows(board_with_index_in_empty_spaces)
    board_split_into_rows.each_with_index do |row, row_index|
      single_row = ""
      row.each_with_index {|space, space_index| single_row = format_single_row(space, space_index, board_split_into_rows, single_row)}
      print_board_rows_with_separator(row_index, row, single_row)
    end
  end

  def board_with_index_in_empty_spaces
    @game.board.spaces.each_with_index.map {|space, index| !space.nil? ? space : index + OFFSET }
  end

  def split_board_into_rows(spaces)
     spaces.each_slice(@game.board.number_of_rows)
  end

  def format_single_row(space, space_index, board_split_into_rows, single_row)
    formatted_number = add_space_to_single_digit_number(space)
    single_row = add_separator_where_applicable(space_index, board_split_into_rows, single_row, formatted_number)
  end

  def add_space_to_single_digit_number(space)
     space.to_s.length == 1 ? "#{space} " : "#{space}"
  end

  def add_separator_where_applicable(space_index, board_split_into_rows, single_row, formatted_number)
    space_index == board_split_into_rows.size - 1 ? single_row += " #{formatted_number}" : single_row += " #{formatted_number} |"
  end

  def print_board_rows_with_separator(row_index, row, single_row)
    @output.puts row_index == row.size - 1 ? single_row : single_row + "\n" + "-" * single_row.length
  end

  def print_game_over
    @output.puts "Game Over"
  end

  def print_outcome
    clear_screen
    print_game_over
    print_board
    @output.puts @game.board.winner ? "#{@game.board.winner} is the winner" : "Tied Game"
  end

  def print_choose_player(marker)
    @output.puts "Choose player type for #{marker}"
    @output.puts "1) Human"
    @output.puts "2) Simple Computer"
    @output.puts "3) Expert Computer"
  end

  def print_board_size
    @output.puts "Choose the number of rows on the board"
    @output.puts "Select 3 or 4"
  end

  def clear_screen
    @output.puts "\e[2J\e[f"
  end

end
