module Chess
  class Board
    attr_accessor :pieces

    def initialize 
      @pieces = [
        King.new(:black, :e8), 
        King.new(:white, :e1)
      ]
    end

    def draw 
      puts "Draw board"
    end

    def move(color, from, to)
      find_piece(color.to_sym, from.to_sym).move(to.to_sym)
    rescue 
      false
    end

    def find_piece(color, pos)
      pieces.select { |piece| piece.color?(color) && piece.pos?(pos) }.first
    end
  end
end
