module Chess
  class Piece
    include Color

    attr_reader :position, :old_postions, :color

    def initialize(color, pos)
      @color = color
      @position = pos
      @old_positions = []
      add_to_square
    end

    def board
      Board.instance
    end

    def add_to_square
      board.squares.find(@position).first.push(self)
    end

    def remove_from_square
      board.squares.find(@position).first.pop
    end

    def name 
      "#{@color}#{self.class.name}" 
    end

    def move(to)
      do_move(to) if move_allowed?(to)
    end

    def switch_position(to)
      @old_positions << @position
      @position = to
    end

    def do_move(to)
      remove_from_square
      switch_position(to)
      add_to_square
      puts "#{self.class.name} moved from #{@old_positions.last} to #{@position}"
      true
    end

    def move_allowed?(to)
      available_moves.include?(to)
    end

    def available_moves
      moves = calculate_moves

      Board.instance.squares.select do |square| 
        moves.include?(square.name) && square.empty?
      end.map(&:name)
    end

    def color?(color)
      @color == color
    end

    def pos?(pos)
      @position == pos
    end

    def draw_with_color
      @color == :white ? draw : black(draw)
    end

    def draw
      "X"
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

    def calculate_moves
      SquareFactory.instance.squares_names.reject {|x| x == @position}
    end
  end
end
