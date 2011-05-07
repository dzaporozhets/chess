require "spec"

describe Chess::Square do
  before(:each) do 
    Chess::Board.instance.init
    @square = Chess::Square.new("a",1)
  end

  it { @square.should be_an_instance_of(Chess::Square) } 
  it { @square.name.should == :a1 } 

  describe "pushing piece at square" do 
    before(:each) do
      @king = Chess::King.new(:white, :f5)
      @square.push(@king)
    end

    it { @square.piece.should be_an_instance_of(Chess::King) }
    it { @square.empty?.should be_false }
  end

  describe "pop piece from square" do 
    before(:each) do 
      @king = Chess::King.new(:white, :f5)
      @square.push(@king)
      @piece = @square.pop
    end

    it { @piece.should be_an_instance_of(Chess::King)  }
    it { @square.piece.should be_nil }
    it { @square.empty?.should be_true }
  end
end
