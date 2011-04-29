module Chess
  class King < Piece
    def draw
      "K"
    end

    def move_allowed?(to)
      true
    end
  end
end
