require_relative '../lib/styling.rb'

class Board
  attr_reader :symbol

  def initialize            
    @symbol = ['1'.red, '2'.red, '3'.red, '4'.red, '5'.red, '6'.red, '7'.red, '8'.red, '9'.red]
  end

  def update_board(picked_cell, player_sym)
    @symbol[picked_cell] = player_sym
  end

  def display_board
    "#{@symbol[0]} | #{@symbol[1]} | #{@symbol[2]} \r\n---------- \r\n#{@symbol[3]} | #{@symbol[4]} | \
#{@symbol[5]} \r\n---------- \r\n#{@symbol[6]} | #{@symbol[7]} | #{@symbol[8]}\r\n"
  end
end
