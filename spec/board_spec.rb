require './lib/board' #=> add this

describe Board do
  let(:board) { Board.new }

  describe 'initialize' do
    it 'retruns the initial board object with initial symbol values' do
      expect(board.symbol).to eql(['1'.red, '2'.red, '3'.red, '4'.red, '5'.red, '6'.red, '7'.red, '8'.red, '9'.red])
    end
  end

  describe 'update_board' do
    it ' returns arg[1]' do
      board1 = Board.new
      expect(board1.update_board(2, 'X')).to eq('X')
    end

    # it " returns arg[1]" do
    #     board1 = Board.new
    #     expect(board1.update_board(2)).to raise_error(ArgumentError)
    # end
  end

  describe 'display_board' do
    it 'retruns the ' do
      expect(board.display_board).to eql("\e[31m1\e[0m | \e[31m2\e[0m | \e[31m3\e[0m \r\n---------- \
\r\n\e[31m4\e[0m | \e[31m5\e[0m | \e[31m6\e[0m \r\n---------- \r\n\e[31m7\e[0m | \e[31m8\e[0m | \e[31m9\e[0m\r\n")
    end
  end
end
