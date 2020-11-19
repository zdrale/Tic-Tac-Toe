
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

  def initialize(row)
    @row = row
    @symbol = []
    (row * row).times do
      @symbol << ' '
    end
  end

  def update_symbol(picked_cell, player)
    @symbol[picked_cell - 1] = player.sym
  end

  def display_board
    y = @symbol[0].to_s
    (@row - 1).times do |cell|
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
