require "spec"

describe Chess::Piece do
  before(:each) { @piece = Chess::Piece.new(:white, :e6) }

  it { @piece.should be_an_instance_of(Chess::Piece) } 

  it { @piece.should respond_to(:move) } 
  it { @piece.should respond_to(:draw) } 

  describe "color" do
    it { @piece.color?(:white).should be_true }
    it { @piece.color?(:black).should be_false }
  end

  describe "position" do
    it { @piece.pos?(:e6).should be_true }
    it { @piece.pos?(:e7).should be_false }
  end

  describe "simple move rules" do 
    before(:each) do
      @board = Chess::Board.instance
      @board.init

      @piece1 = Chess::Piece.new(:white, :e6)
      @piece2 = Chess::Piece.new(:white, :e7)
    end
    it "should not move on busy square" do 
      @piece1.move(:e7).should be_false
    end
  end
end
