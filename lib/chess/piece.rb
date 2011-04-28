module Chess
  class Piece
    attr_reader :position, :old_postions, :color

    def initialize(color, pos)
      @color = color
      @position = pos
      @old_positions = []
    end

    def move(to)
      do_move(to) if move_allowed?(to)
    end
    
    def do_move(to)
      @old_positions << @position
      @position = to
      puts "#{self.object_id} moved from #{@old_positions.last} to #{@position}"
      true
    end

    def move_allowed?(to)
      true
    end

    def color?(color)
      @color == color
    end

    def pos?(pos)
      @position == pos
    end

    def draw_with_color
      @color == :white ? 
        "\033[0m#{draw}\033[0m" : 
        "\033[90m#{draw}\033[0m"
    end

    def draw
      "X"
    end
  end
end
