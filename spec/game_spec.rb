require "spec"

describe Game do
  it { Game.new.should_not be_nil }
  it { Game.new.should respond_to(:start) }
end
