# require_relative 'board'

class Piece 
  attr_reader :piece, :grid
  
  attr_accessor :pos
  
  def initialize(piece, board, pos)
    @piece, @pos, @board = piece, pos, board 
    
    board.add_piece(self, pos)
    ### leave this up to the board.
  end 
    
  
    
end