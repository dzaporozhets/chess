require "rubygems"
require "bundler/setup"
require "singleton"

Bundler.require

require "lib/color"
require "lib/chess/board"
require "lib/chess/factory"
require "lib/chess/square"
require "lib/chess/square_factory"

require "lib/chess/piece"
require "lib/chess/piece_factory"

require "lib/chess/king"
require "lib/chess/queen"
require "lib/chess/rook"
require "lib/chess/bishop"
require "lib/chess/knight"
require "lib/chess/pawn"
