module Chess
  class King < Piece
    def draw
      "K"
    end

    def calculate_moves
      moves = []

      coords = position_to_digits(@position)

      [coords[0] - 1, coords[0], coords[0] + 1].each do |i|
        [coords[1] - 1, coords[1], coords[1] + 1].each do |j|
          moves << "#{digit_to_letter(i)}#{j}".to_sym
        end
      end
      coords[0] + 1
      coords[0] - 1

      moves.reject{|x| x == @position}    
    end
  end
end
