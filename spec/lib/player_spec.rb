require './lib/player'

describe Player do
  describe "#initialize" do
    it "requires an initial position" do
      expect { player = Player.new }.to raise_error Player::UndefinedPosition
    end

    it "requires integer values" do
      expect {
        player = Player.new(x: 'a', y: 3.7)
      }.to raise_error Player::PositionTypeMismatch
    end
  end

  describe "posiiton" do
    it "returns the position of the player" do
      player = Player.new(x: 0, y: 1)
      expect(player.position.x).to eq 0
      expect(player.position.y).to eq 1
    end
  end
end
