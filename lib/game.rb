require "lib/chess"
require "lib/color"

class Game
  include Color

  def initialize
    @board = Chess::Board.new
  end

  def start
    colors = [:white, :black]
    
    loop do
      color = colors.last
      puts green("#{color} - Tour turn: ")

      @board.draw
      if user_input(color)
        colors.reverse!
      else 
        puts red("Wrong turn!")
      end
    end
  end

  def user_input(color)
    print "From: "
    from = $stdin.gets.chomp

    print "From: #{from} to: "
    to = $stdin.gets.chomp

    puts "Moving from: #{from} to: #{to}"

    @board.move(color, from, to)
  end
end
