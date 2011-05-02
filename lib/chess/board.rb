module Chess
  class Board
    attr_reader :pieces, :squares

    def initialize(empty = false)
      @squares = Chess::Factory.build_squares
      @pieces = empty ? [] : Chess::Factory.build_pieces(self) 
    end

    def add_piece(piece)
      if piece.respond_to?(:board)
        @pieces << piece
        piece.board = self
      end
    end

    def draw 
      puts "Draw board"
    end

    def move(color, from, to)
      find_piece_by_color(color.to_sym, from.to_sym).move(to.to_sym)
    rescue 
      false
    end

    def find_piece_by_color(color, pos)
      @pieces.select { |piece| piece.color?(color) && piece.pos?(pos) }.first
    end

    def find_piece(pos)
      @pieces.select { |piece| piece.pos?(pos.to_sym) }.first
    end

    def draw
      (1..8).to_a.reverse.each do |iv|
        print "#{iv}. " 
        ("a".."h").each do |ih|
          print "|"

          pos = "#{ih}#{iv}"
          figure = find_piece(pos)
          print figure ? figure.draw_with_color : " "
        end
        print "|"
        puts
        if iv == 1
          print "   "
          ("a".."h").each { |ihn| print " #{ihn}" }
        end
      end
      puts
    end
  end
end
