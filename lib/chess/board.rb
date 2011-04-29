module Chess
  class Board
    attr_accessor :pieces

    def initialize
      #@squares = build_squares

      @pieces = [
        Bishop.new(:black, :c8), 
        Bishop.new(:white, :c1),
        Bishop.new(:black, :f8), 
        Bishop.new(:white, :f1),

        Knight.new(:black, :b8), 
        Knight.new(:white, :b1),
        Knight.new(:black, :g8), 
        Knight.new(:white, :g1),

        Rook.new(:black, :a8), 
        Rook.new(:white, :a1),
        Rook.new(:black, :h8), 
        Rook.new(:white, :h1),

        Queen.new(:black, :d8), 
        Queen.new(:white, :d1),
        King.new(:black, :e8), 
        King.new(:white, :e1)
      ]

      [:black, :white].each do |color|
        ("a".."h").each do |ih|
          iv = (color == :white) ? 2 : 7
          @pieces << Pawn.new(color, "#{ih}#{iv}".to_sym)
        end
      end
    end

    #def build_squares
      #squares = []
      #(1..8).each do |d| 
        #("a".."h").each do |l|
          #squares << Square.new(l, d)
        #end
      #end
      #squares
    #end

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
