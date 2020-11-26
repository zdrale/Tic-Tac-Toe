require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

class TicTacToe
  WIN_TRIPLETS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def create_players(name1, name2)
    @players = [Player.new(name1), Player.new(name2)]
  end

  def create_board
    @board = Board.new
  end

  def print_board
    print @board.display_board
  end

  def pick_symbol(sym1, sym2)
    @players[0].pick_symbol(sym1)
    @players[1].pick_symbol(sym2)
  end

  def set_beginner
    beginner = gets.chomp.to_s
    until [@players[0].name, @players[1].name].include?(beginner)
      puts 'wrong input, Please insert correct player name: '
      beginner = gets.chomp.to_s
    end

    @players[0], @players[1] = @players[1], @players[0] unless beginner == @players[0].name
  end

  def put_current_player(step)
    @current_player = @players[step % 2]
  end

  def put_next_player(step)
    @next_player = @players[step % 2 + 1]
  end

  def check_move(pick)
    (@board.symbol[pick] != ' ') || !(0..8).cover?(pick) ? true : false
  end

  def update_board(pick)
    @board.update_board(pick, @current_player)
  end

  def win_move?(picked, symb = @current_player.sym)
    WIN_TRIPLETS.each do |triplet|      
      return true if triplet.include?(picked+1) && [@board.symbol[triplet[0] - 1], @board.symbol[triplet[1] - 1],
                      @board.symbol[triplet[2] - 1]].count(symb) == 2
    end
  end

  def draw_move?
    remains = []
    (0..8).each do |i|
      remains << i unless @board.symbol[i] != ' '
      next i
    end   
    
    unless remains.size <= 1  
      puts "remains are: #{remains[0]+1} and #{remains[1]+1}"
      if win_move?(remains[0], @next_player.sym) == true || win_move?(remains[1], @current_player.sym) == true 
        return false
      end
      
      if win_move?(remains[1], @next_player.sym) == true || win_move?(remains[0], @current_player.sym) == true      
        return false
      end
    end
    if remains.size == 1    
      puts "remains are: #{remains[0]+1}" 
      if win_move?(remains[0], @current_player.sym) == true        
        return false
      end
    end    
    true
  end
end
