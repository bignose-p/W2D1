require_relative 'piece'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end 
  
  def [](pos)
    x, y = pos
    @grid[x][y]
  end 
  
  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end
  
  def add_piece(piece, pos)
    ## add error case
    self[pos] = piece
    ###                 
  end
  
  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    
    if piece == nil ### || !valid_move?(end_pos)
      raise MoveError 
    end
    
    piece.pos = end_pos
    self[start_pos] = nil 
    self[end_pos] = piece 
    
    nil
  end
  
  # def valid_move(pos)
  # 
  # end
end 

class MoveError < StandardError
  def message
    puts "Invalid Move"
  end 
  
end 

