module Chess
  class King < Piece
    def draw
      "K"
    end

    def move_allowed?(to)
      available_moves.include?(to)
    end

    def available_moves
      moves = calculate_moves

      @board.squares.select { |square| moves.include? square.name }.map(&:name)
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
  end
end
