require './lib/player' #=> add this
describe Player do
  let(:player1) { Player.new('Henok', 'X') }
  let(:player2) { Player.new('Nikola') }
  let(:player3) { Player.new('X') }
  let(:player4) { Player.new }
  describe 'initialize' do
    it 'returns player object pointer when a player object is created by name and symbol' do
      expect(player1).to be_kind_of(Player)
    end
    # it "returns Argument error when object is attempted to be created by name only" do
    #     expect(Player.new('Nikola')).to be_a(ArgumentError)
    # end
    # it "returns Argument error when a player object is attempted to be created by symbol only" do
    #     expect(player3).to raise_error(ArgumentError)
    # end
    # it "returns Argument error when object is attempted to be created with no argument" do
    #     expect(player4).to raise_error(ArgumentError)
    # end
    it 'retruns the name of the created player object' do
      expect(player1.name).to eql('Henok')
    end
    it 'returns symbol of the created player object' do
      expect(player1.sym).to eql('X')
    end
    it 'returns ' do
      expect(player1.sym).not_to eql('O')
    end
  end
end
