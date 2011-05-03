module Chess
  class Square
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
  end
end
