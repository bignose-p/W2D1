### MAKE SEPARATE FILES FOR PIECE CLASSES.
require 'byebug'

module SlidingPiece       #receives potential direction (from subclass method move_dirs)
                          #implement Piece's move method 
  def horizontal_dirs
    [
      [-1, 0,],
      [0, -1],
      [0, 1],
      [1, 0]
    ]
  end
  
  def diagonal_dirs
    [
      [-1, -1,],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end
  
  def moves
    moves = []
    move_dirs.each do |dx, dy|
      moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end
    moves
  end
  
  private
  
  def grow_unblocked_moves_in_dir(dx, dy)
    pot_moves = []
    start_pos = self.pos
     
    while true
      check_pos = [ (start_pos[0] + dx), (start_pos[1] + dy) ]
       
      if board.valid_pos?(check_pos)
        break unless board[check_pos].nil?
        pot_moves << check_pos
        start_pos = pot_moves.last 
      else
        break
      end
    end
    
    pot_moves
  end
  
end 

module SteppingPiece 
  def knight_dirs
    [
      [2, -1],
      [-2, 1,],
      [-2, -1],
      [2, 1],
      [1, -2],
      [1, 2],
      [-1, -2],
      [-1, 2]
    ]
  end 
  
  def king_dirs 
    [
      [-1, 0,],
      [1, 0],
      [0, -1],
      [0, 1],
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]
    ]
  end
  
  def moves
    moves = []
    start_pos = self.pos
    
    move_dirs.each do |dx, dy|
      check_pos = [ (start_pos[0] + dx), (start_pos[1] + dy) ]
      if board.valid_pos?(check_pos) && board[check_pos].nil?
        moves << check_pos
      end
    end
    moves
  end
end

class Piece 
  attr_reader :color, :board
  attr_accessor :pos
  
  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end 
    
  # def moves #returns array of places piece can make a move to 
  # 
  # end
end

class Rook < Piece 
  include SlidingPiece
  
  def symbol
    '♖'.colorize(color)
  end
  
  protected
  
  def move_dirs
    horizontal_dirs
  end
end

class Bishop < Piece 
  include SlidingPiece
  
  def symbol
    '♗'.colorize(color)
  end
  
  protected
  
  def move_dirs
    diagonal_dirs
  end
  
end

class Queen < Piece
  include SlidingPiece
  
  def symbol
   '♕'.colorize(color)
  end
  
  protected
  
  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end

class King < Piece
  include SteppingPiece
  
  def symbol
    '♔'.colorize(color)
  end
  
  protected
  
  def move_dirs
    king_dirs
  end
  
end

class Knight < Piece
  include SteppingPiece
  
  def symbol
    '♘'.colorize(color)
  end
  
  protected
  
  def move_dirs
    knight_dirs
  end
  
end