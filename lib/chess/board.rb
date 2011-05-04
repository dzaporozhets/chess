module Chess
  class Board
    include Singleton
    
    def initialize
      SquareFactory.instance.build_squares
      PieceFactory.instance.build_pieces
    end

    def squares 
      SquareFactory.instance
    end

    def pieces
      PieceFactory.instance.on_board
    end

    def add_piece(piece)
      if piece.respond_to?(:board)
        SquareFactory.find_by_name(piece.name).add_to_board(self)
        SquareFactory.instance.find(piece.position).first.push(piece)
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
