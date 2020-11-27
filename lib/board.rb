class Board
  attr_reader :symbol, :moves

  def initialize
    @moves = []
    @symbol = []
    9.times do
      @symbol << ' '
    end
  end

  def update_board(picked_cell, player)
    @symbol[picked_cell] = player.sym
  end

  def display_board
    "#{@symbol[0]} | #{@symbol[1]} | #{@symbol[2]} \r\n---------- \r\n#{@symbol[3]} | #{@symbol[4]} | \
#{@symbol[5]} \r\n---------- \r\n#{@symbol[6]} | #{@symbol[7]} | #{@symbol[8]}\r\n"
  end
end
