require "lib/chess"

class Game
  def initialize
    @board = Chess::Board.new
  end

  def start
    colors = [:white, :black]
    
    loop do
      color = colors.last
      puts "\033[92m#{color}\033[0m - Tour turn: "

      @board.draw
      if user_input(color)
        colors.reverse!
      else 
        puts "\033[91mWrong turn!\033[0m"
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
