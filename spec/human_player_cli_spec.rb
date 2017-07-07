require 'human_player_cli'

RSpec.describe HumanPlayer do

  subject(:player) { described_class.new("X", double("cli")) }

  context "At setup, a player" do

    it "is initialized with a marker" do
      expect(player.marker).to eq "X"
    end

  end

end
