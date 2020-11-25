require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

class TicTacToe

    WIN_TRIPLETS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

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
      (@board.symbol[pick] != ' ') || !(0..10).cover?(pick) ? true : false
    end
  
    def update_board(pick)
      @board.update_board(pick, @current_player)
    end
  
    def win_move?
      
        WIN_TRIPLETS.each do |triplet|
        return true if [@board.symbol[triplet[0] - 1], @board.symbol[triplet[1] - 1],
                        @board.symbol[triplet[2] - 1]].all?(@current_player.sym) == true
      end
    end

    def draw_move?  
        remains = []  
        for i in (0..8)
            unless @board.symbol[i] != ' '
                remains << i 
            end 
            next i 
        end 

        puts "remains are: "
        puts remains 
        unless remains.size <= 1             
            @board.symbol[remains[0]] = @current_player.sym  
            @board.symbol[remains[1]] = @next_player.sym  
            
            if self.win_move? == true 
                @board.symbol[remains[0]] = ' ' 
                @board.symbol[remains[1]] = ' ' 
                return false  
            end 

            @board.symbol[remains[0]] = @next_player.sym  
            @board.symbol[remains[1]] = @current_player.sym 
            if self.win_move? == true
                @board.symbol[remains[0]] = ' ' 
                @board.symbol[remains[1]] = ' ' 
                return false 
            end  
        end    
        if remains.size == 1
            @board.symbol[remains[0]] = @current_player.sym
            if self.win_move? == true
                @board.symbol[remains[0]] = ' '
                return false 
            end 
        end 
        @board.symbol[remains[0]] = ' ' 
        @board.symbol[remains[1]] = ' '
        true 
    end
end