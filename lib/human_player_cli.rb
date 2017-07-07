class HumanPlayer

  attr_reader :marker

  def initialize(marker, ui)
    @marker = marker
    @ui = ui
  end

  def choose_space(board)
    @ui.place_marker(board.check_available_spaces)
  end
end
