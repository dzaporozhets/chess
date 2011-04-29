module Chess
  class Square
    attr_accessor :letter, :digit, :name

    def initialize(l, d)
      @letter, @digit = l, d
      @name = "#{l}#{d}".to_sym
    end

    def empty?
      true
    end
  end
end
