class TicTacToe
    attr_accessor :name, :player
  
    def initialize(name)
      @name = name
      @player = []
      puts "Game initiated: Game name is #{name}"
    end
  
    def add_player(player)
      @player << player
      player.game = self
    end
  
    def starter(beginner, _max_moves)
      @beginner = beginner
      break unless @beginner.to_s != @player[0].name.to_s
  
      a = @player[0]
      @player[0] = @player[1]
      @player[1] = a
    end
  
    def move(picked_cell)
      @picked_cell = picked_cell
    end
  
    def current_player(move_no)
      @move_no = move_no
      @current_player = @player[move_no % 2]
    end
  end
  
  class Player
    attr_accessor :name, :game, :sym
  
    def initialize(name)
      @name = name
    end
  
    def pick_symbol(sym)
      @sym = sym
    end
  end
  
  class Board
    attr_accessor :row
  
    def initialize(symbol)
      @symbol = []
      9.times do
        @symbol << ' '
      end
    end
  
    def update_symbol(picked_cell, player)
      @symbol[picked_cell - 1] = player.sym
    end
  
    def display_board
      y = @symbol[0].to_s
      2.times do |cell|
        x = ' |' + @symbol[cell + 1].to_s
        y += x
      end
      puts y
      (@row - 1).times do |h|
        rc = (h + 1) * @row
        y = @symbol[rc].to_s
        puts '-' * (@row * 3 - 1)
        (@row - 1).times do
          x = ' |' + @symbol[rc + 1].to_s
          y += x
          rc += 1
        end
        puts y
      end
    end
end
  

print welcome_text

puts 'Please Insert the Match Name'

match_name = gets.chomp

game = TicTacToe.new(match_name)

puts 'Insert name of players: '

player1 = Player.new(gets.chomp)
player2 = Player.new(gets.chomp)

game.add_player(player1)
game.add_player(player2)

puts 'The players are: '
puts player1.name
puts player2.name

puts 'Now you insert the row or column numbers of your choice: '

rows = gets.chomp.to_i
board = Board.new(rows)

board.display_board

puts 'Ok ' + player1.name + ' please pick your symbol: '

sym1 = player1.pick_symbol(gets.chomp.to_s)

puts 'Ok ' + player2.name + ' please pick your symbol: '

sym2 = player2.pick_symbol(gets.chomp.to_s)

puts player1.name + ' choses ' + sym1
puts player2.name + ' choses ' + sym2

puts 'Game is ready. Now pick the player for the first move: '

beginner = gets.chomp.to_s

game.starter(beginner, 25)

puts player1.name + ' will start'

rows.times do |i|
  curr_player = game.current_player(i)

  puts '@ ' + curr_player.name + ', now your turn. Pick a cell: '
  pick = gets.chomp

  puts board.update_symbol(pick.to_i, curr_player)

  board.display_board
end