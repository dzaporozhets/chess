class Square
  class << self
    def all
      @positions
    end

    def find_available_positions(position, args)
      positions = []

      coords = position_to_digits(position)

      if args[:type] == :king
        [coords[0] - 1, coords[0], coords[0] + 1].each do |i|
          [coords[1] - 1, coords[1], coords[1] + 1].each do |j|
            pos = "#{digit_to_letter(i)}#{j}".to_sym
            positions << pos if position_available?(pos, args[:color])
          end
        end
        coords[0] + 1
        coords[0] - 1
      end
      positions.reject{|x| x== position}
    end

    def position_to_digits(position)
      coord = position.to_s.chars.to_a
      letter = letter_to_digit coord[0]
      digit = coord[1].to_i
      [letter, digit]
    end

    def letter_to_digit(letter)
      letters.each_index { |i| return i if letters[i] == letter}
    end

    def digit_to_letter(digit)
      letters.each_index { |i| return letters[i] if i == digit}
    end
    
    def letters
      @letters ||= ("a".."z").to_a
    end

    def position_available?(pos, color)
      true
    end
  end


  attr_reader :ih, :iv, :name

  def initialize(ih, iv)
    @ih, @iv = ih, iv
    @name = "#{ih}#{iv}".to_sym
  end
end
