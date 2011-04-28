require "lib/chess"

board = Chess::Board.new

loop do
  print "From: "
  from = $stdin.gets.chomp

  print "From: #{from} to: "
  to = $stdin.gets.chomp

  puts "Moving from: #{from} to: #{to}"

  puts board.move(:black, from, to)
end
