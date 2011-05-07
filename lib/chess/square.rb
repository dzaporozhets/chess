module Chess
  class Square
    include Color

    attr_reader :ih, :iv, :name, :piece

    def initialize(ih, iv)
      @ih, @iv = ih, iv
      @name = "#{ih}#{iv}".to_sym
    end

    def empty?
      @piece.nil?
    end

    def push(item)
      @piece = item
    end

    def pop
      item, @piece = @piece, nil
      item
    end

    def draw
      figure = @piece ? @piece.draw_with_color : " "
      gray_bg(" ") + gray_bg(figure) + gray_bg(" ")
    end
  end
end
