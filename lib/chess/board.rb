module Chess
  class Board
    include Singleton
    include Color

    def init(empty = false)
      reset
      SquareFactory.instance.build_squares
      PieceFactory.instance.build_pieces unless empty
    end

    def reset
      SquareFactory.instance.reset
      PieceFactory.instance.reset
    end

    def squares 
      SquareFactory.instance
    end

    def pieces
      PieceFactory.instance.on_board
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
      pieces.select { |piece| piece.color?(color) && piece.pos?(pos) }.first
    end

    def find_piece(pos)
      pieces.select { |piece| piece.pos?(pos.to_sym) }.first
    end

    def draw
      (1..8).to_a.reverse.each do |iv|
        puts 
        print "#{gray(iv)}. " 
        ("a".."h").each do |ih|
          print "  "
          print squares.find("#{ih}#{iv}".to_sym).first.draw
        end
        print "   "
        puts
        if iv == 1
          puts
          print "   "
          ("a".."h").each { |ihn| print "   #{gray(ihn)} " }
        end
      end
      puts
    end
  end
end
