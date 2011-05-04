module Chess
  class PieceFactory
    include Singleton
    include Enumerable

    attr_reader :pieces, :pieces_on_board

    def initialize 
      @pieces = []
      @pieces_on_board = []
    end

    def each
      @pieces.each { |piece| yield(piece) } 
    end

    def find_by_name(name)
      @pieces.select { |p| p.name == name }.first
    end

    def on_board
      @pieces_on_board
    end

    def build_pieces
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

      @pieces = @pieces_on_board
    end
  end
end

