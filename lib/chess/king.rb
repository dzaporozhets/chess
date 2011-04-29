module Chess
  class King < Piece
    def draw
      "K"
    end

    def move_allowed?
      false
    end
  end
end
