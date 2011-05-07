require "spec"

describe Game do
  it { Game.instance.should_not be_nil }
  it { Game.instance.should respond_to(:start) }
end
