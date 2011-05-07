module Chess
  class SquareFactory
    include Singleton
    include Enumerable

    attr_reader :squares

    def reset
      @squares = []
    end

    def each
      @squares.each { |square| yield(square) } 
    end

    def create(ih, iv)
      @squares << Square.new(ih, iv) 
    end

    def find(name)
      @squares.select { |s| s.name == name }
    end

    def build_squares
      ("a".."h").each do |ih|
        (1..8).each do |iv|
          create(ih, iv)
        end
      end
      @squares
    end

    def squares_names
      @squares.map(&:name)
    end
  end
end
