# spec/tictactoe_spec.rb
require './lib/tictactoe'

describe TicTacToe do
  let(:game) { TicTacToe.new }

  describe 'create_players' do
    it 'returns name of player one' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(players[0].name).to eql('Henok')
    end
    it 'returns name of player two' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(players[1].name).to eql('Nikola')
    end
    it 'returns symbol of player two' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(players[0].sym).to eql('X')
    end
    it 'returns symbol of player two' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(players[1].sym).to eql('O')
    end
    it 'returns Argument error when wrong number of argumets is given' do
      expect { game.create_players('Henok', 'Nikola', 'X') }.to raise_error(ArgumentError)
    end
  end

  describe 'create_board' do
    it 'returns ' do
      expect(game.create_board).to be_kind_of(Board)
    end
  end

  describe 'print_board' do
    it ' returns nil value' do
      game.create_board
      expect(game.print_board).to eql(nil)
    end
    it ' returns nil value' do
      expect { game.print_board }.to raise_error(NoMethodError)
    end
  end

  describe 'check_beginner?' do
    it ' returns false while argument input is one of the players names' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(game.check_beginner('Henok')).to eql(false)
    end
    it ' returns true while argument input is not one of the players names' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(game.check_beginner('David')).to eql(true)
    end
  end

  describe 'set_beginner' do
    it ' switches the index of the players ' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      game.set_beginner
      expect(players[0].name).to eql('Nikola')
    end
    it ' does not keep the playr index as initially' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      game.set_beginner
      expect(players[0].name).not_to eql('Henok')
    end
  end

  describe 'put_current_player' do
    it ' returns player object with index equal to argument modulus with 2' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(game.put_current_player(1)).to eql(players[1])
    end

    it ' returns player object with index equal to argument modulus with 2' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(game.put_current_player(4)).to eql(players[0])
    end

    it ' returns player object with index equal to argument modulus with 2' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(game.put_current_player(4)).to_not eql(players[1])
    end
  end

  describe 'put_next_player' do
    it ' returns player object with index equal to argument modulus with 2 plus 1' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(game.put_next_player(1)).to eql(players[0])
    end

    it ' returns player object with index equal to argument modulus with 2' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(game.put_next_player(4)).to eql(players[1])
    end

    it ' returns player object with index equal to argument modulus with 2' do
      players = game.create_players('Henok', 'Nikola', 'X', 'O')
      expect(game.put_next_player(4)).not_to eql(players[0])
    end
  end

  describe 'check_move?' do
    it ' returns false when move is available and valid' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      game.create_board
      game.update_board(4)
      expect(game.check_move(0)).to eql(false)
    end

    it 'returns true when move is not available' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      game.create_board
      game.update_board(0)
      expect(game.check_move(0)).to eql(true)
    end

    it 'returns true when move is out of range' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      game.create_board
      game.update_board(4)
      expect(game.check_move(10)).to eql(true)
    end

    it 'returns true when move is out of range' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      game.create_board
      game.update_board(4)
      expect(game.check_move(10)).not_to eql(false)
    end

    it 'returns true when move is out of range' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      game.create_board
      game.update_board(4)
      expect { game.check_move('T') }.to raise_error(TypeError)
    end

    it 'returns true when move is out of range' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      game.create_board
      game.update_board(4)
      expect { game.check_move }.to raise_error(ArgumentError)
    end
  end

  describe 'update_board' do
    it 'retruns' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      board = game.create_board
      game.update_board(3)
      expect(board.symbol[3]).to eql('O')
    end
    it 'retruns' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      board = game.create_board
      game.update_board(3)
      expect(board.symbol[3]).not_to eql('X')
    end
    it 'retruns' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      game.put_current_player(1)
      game.create_board
      expect { game.update_board }.to raise_error(ArgumentError)
    end
  end

  describe 'win_move?' do
    it 'returns true if sumbol indices 0, 1 and 2 have same value' do
      board = game.create_board
      board.symbol[0] = 'O'
      board.symbol[1] = 'O'
      expect(game.win_move?(2, 'O')).to eql(true)
    end
    it 'returns true if sumbol indices 3, 4 and 5 have same value' do
      board = game.create_board
      board.symbol[3] = 'O'
      board.symbol[4] = 'O'
      expect(game.win_move?(5, 'O')).to eql(true)
    end
    it 'returns true if sumbol indices 6, 7 and 8 have same value' do
      board = game.create_board
      board.symbol[6] = 'O'
      board.symbol[7] = 'O'
      expect(game.win_move?(8, 'O')).to eql(true)
    end
    it 'returns true if sumbol indices 0, 3 and 6 have same value' do
      board = game.create_board
      board.symbol[0] = 'O'
      board.symbol[3] = 'O'
      expect(game.win_move?(6, 'O')).to eql(true)
    end
    it 'returns true if sumbol indices 0, 4 and 8 have same value' do
      board = game.create_board
      board.symbol[0] = 'O'
      board.symbol[4] = 'O'
      expect(game.win_move?(8, 'O')).to eql(true)
    end
    it 'returns true if sumbol indices 2, 5 and 8 have same value' do
      board = game.create_board
      board.symbol[2] = 'O'
      board.symbol[5] = 'O'
      expect(game.win_move?(8, 'O')).to eql(true)
    end
    it 'returns true if sumbol indices 0, 4 and 8 have same value' do
      board = game.create_board
      board.symbol[0] = 'O'
      board.symbol[4] = 'O'
      expect(game.win_move?(8, 'O')).to eql(true)
    end
    it 'returns true if sumbol indices 2, 4 and 6 have same value' do
      board = game.create_board
      board.symbol[2] = 'O'
      board.symbol[4] = 'O'
      expect(game.win_move?(6, 'O')).to eql(true)
    end
    it 'returns false if the move does not make winning combination' do
      board = game.create_board
      board.symbol[2] = 'O'
      board.symbol[4] = 'O'
      expect(game.win_move?(7, 'O')).to eql(false)
    end
    it 'returns false if three winning symbol indices does not have same value' do
      board = game.create_board
      board.symbol[0] = 'O'
      board.symbol[4] = 'X'
      expect(game.win_move?(8, 'O')).to eql(false)
    end
  end

  describe 'draw_move?' do
    it "returns true when two remaining moves doesn't ensure win" do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      board = game.create_board
      board.update_board(0, 'X')
      board.update_board(1, 'X')
      board.update_board(2, 'O')
      board.update_board(3, 'O')
      board.update_board(4, 'O')
      board.update_board(5, 'X')
      board.update_board(6, 'X')
      game.put_current_player(6)
      game.put_next_player(6)
      expect(game.draw_move?).to eql(true)
    end
    it "returns true when one remaining move doesn't ensure win" do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      board = game.create_board
      board.update_board(0, 'O')
      board.update_board(1, 'X')
      board.update_board(2, 'O')
      board.update_board(3, 'X')
      board.update_board(4, 'x')
      board.update_board(5, 'O')
      board.update_board(6, 'X')
      game.put_current_player(7)
      game.put_next_player(7)
      expect(game.draw_move?).to eql(true)
    end

    it 'returns false when three or more remaining moves are left' do
      game.create_players('Henok', 'Nikola', 'X', 'O')
      board = game.create_board
      board.update_board(0, 'X')
      board.update_board(1, 'X')
      board.update_board(2, 'O')
      board.update_board(3, 'O')
      board.update_board(4, 'O')
      board.update_board(5, 'X')

      game.put_current_player(5)
      game.put_next_player(5)
      expect(game.draw_move?).to eql(false)
    end
  end
end
