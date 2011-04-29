require "spec"

describe Chess::King do
  before(:each) { @king = Chess::King.new(:white, :f5) }

  it { @king.should be_an_instance_of(Chess::King) } 

  describe "move" do
    [:e6, :e5, :e4, :f6, :f4, :g6, :g5, :g4].each do |square|
      it { @king.move_allowed?(square).should be_true }
    end

    [:f5, :f8, :f9, :k5, :a4].each do |square|
      it { @king.move_allowed?(square).should be_false }
    end
  end
end

