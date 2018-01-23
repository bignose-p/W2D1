require_relative 'piece'

class MoveError < StandardError
  def message
    puts "Invalid Move"
  end 
  
end 

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate
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
  end
  
  def populate
    # populate white pieces
    0.upto(1) do |x|
      self.grid[x].each_with_index do |col, y|
          pos = [x, y]
          add_piece(Piece.new(:white, self, pos), pos)
      end
    end 
    # populate white pieces
    6.upto(7) do |x|
      self.grid[x].each_with_index do |col, y|
        pos = [x, y]
        add_piece(Piece.new(:black, self, pos), pos)
      end
    end 
  end 
  
  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    
    if piece == nil
      raise MoveError 
    end
    
    piece.pos = end_pos
    self[start_pos] = nil 
    self[end_pos] = piece 
    
    nil
  end
  
  def valid_pos?(pos)
    pos.all? { |e| e.between?(0,7) } # && self[pos].nil?
  end
  

  
end 


