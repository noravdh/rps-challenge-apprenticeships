require './app'

describe Game do
  let(:player) { Player.new('Nora') }
  subject(:game) { Game.new(player) }
  it "can return it's player" do
    expect(game.player).to eq player
  end

  it "can choose an option" do
    allow(game).to receive(:game_choice).and_return("Rock")
    expect(game.game_choice).to eq "Rock"
  end

  context "game choice is rock"
  before { game.instance_variable_set(:@game_choice, "Rock") }
  it "can find a winner" do
    allow(player).to receive(:choice).and_return("Paper")
    expect(game.winner).to include("You win!")
  end
end
