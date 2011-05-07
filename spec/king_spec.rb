require "spec"

describe Chess::King do
  before(:each) do 
    @king = Chess::King.new(:white, :f5)
  end

  it { @king.should be_an_instance_of(Chess::King) } 

  describe "move" do
    # For poistion of :f5 next rules should be defined
    #   K - king piece
    #   x - allowed
    #
    # 7
    # 6   x x x
    # 5   x K x
    # 4   x x x
    # 3
    #   d e f g h
    describe "simple rules" do 
      before(:each) do 
        @board = Chess::Board.instance
        @board.init(true)

        @king = Chess::King.new(:white, :f5)
      end

      it "should succesfully move piece to correct square" do 
        @king.move(:g5).should be_true
      end

      it "should be allowed by rule for exist squares" do
        [:e6, :e5, :e4, :f6, :f4, :g6, :g5, :g4].each do |square|
          @king.move_allowed?(square).should be_true
        end
      end

      it "should not be allowed by rule for exist squares" do 
        [:f5, :f8, :f9, :k5, :a4].each do |square|
          @king.move_allowed?(square).should be_false
        end
      end
    end
  end
end
