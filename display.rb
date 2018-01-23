require 'colorize'
require_relative 'cursor'

class Display
  
  attr_reader :board, :cursor
  
  def initialize(board)
    @board = board 
    @cursor = Cursor.new([0,0], board)
  end
  
  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      # if cursor? display a square
      if [i, j] == cursor.cursor_pos
        piece.is_a?(Piece) ? " X ".colorize(:background => :green) : "   ".colorize(:background => :green)
      else
        piece.is_a?(Piece) ? " X " : "   "
      end
      # color_options = colors_for(i, j)
      # piece.to_s.colorize(color_options)
    end
  end

  # def colors_for(i, j)
  #   if cursor.cursor_pos == [i, j] && cursor.selected
  #     bg = :light_green
  #   elsif cursor.cursor_pos == [i, j]
  #     bg = :light_red
  #   elsif (i + j).odd?
  #     bg = :light_blue
  #   else
  #     bg = :light_yellow
  #   end
  #   { background: bg }
  # end

  def render
    system("clear")
    # puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
    # @notifications.each do |_key, val|
      # puts val
    # end
  end
  
  def run
    while true
      render
      input = cursor.get_input
      
    end
  end

end

# ruby display.rb will run all this shyt

b = Board.new
disp = Display.new(b)

disp.run