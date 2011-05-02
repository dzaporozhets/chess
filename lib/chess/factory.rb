module Chess
  class Factory
    class << self
      def build_squares
        squares = []
        ("a".."h").each do |ih|
          (1..8).each do |iv|
            squares << Square.new(ih, iv)
          end
        end
        squares
      end

      def build_pieces(board)
        pieces = [
          Bishop.new(:black, :c8, board), 
          Bishop.new(:white, :c1, board),
          Bishop.new(:black, :f8, board), 
          Bishop.new(:white, :f1, board),

          Knight.new(:black, :b8, board), 
          Knight.new(:white, :b1, board),
          Knight.new(:black, :g8, board), 
          Knight.new(:white, :g1, board),

          Rook.new(:black, :a8, board), 
          Rook.new(:white, :a1, board),
          Rook.new(:black, :h8, board), 
          Rook.new(:white, :h1, board),

          Queen.new(:black, :d8, board), 
          Queen.new(:white, :d1, board),

          King.new(:black, :e8, board),
          King.new(:white, :e1, board)
        ]

        [:black, :white].each do |color|
          ("a".."h").each do |ih|
            iv = (color == :white) ? 2 : 7
            pieces << Pawn.new(color, "#{ih}#{iv}".to_sym, board)
          end
        end

        pieces
      end
    end
  end
end
