#!/usr/bin/env ruby
def display_board(moves_array)
    puts "#{moves_array[0]} | #{moves_array[1]} | #{moves_array[2]}"
    puts '----------'
    puts "#{moves_array[3]} | #{moves_array[4]} | #{moves_array[5]}"
    puts '----------'
    puts "#{moves_array[6]} | #{moves_array[7]} | #{moves_array[8]}"
  end
  
  puts 'Hi, Welcome to TicTacToe game'
  
  puts 'Insert name of players: '
  
  players = []
  sym = []
  
  players << gets.chomp.to_s
  players << gets.chomp.to_s
  
  puts "Hi #{players[0]} and #{players[1]}, welcome to tictactoe game: "
  
  print display_board
  
  puts "Ok #{players[0]} please pick your symbol: "
  
  sym[0] = gets.chomp.to_s
  
  puts "Ok #{players[1]} please pick your symbol: "
  
  sym[1] = gets.chomp.to_s
  
  puts "#{players[0]} choses #{sym[0]}"
  puts "#{players[1]} choses #{sym[1]}"
  
  flag = 'Y'
  
  while flag == 'Y'
  
    i = 0
  
    puts 'Game is ready. Now pick the player for the first move: '
  
    name_match = false
  
    until name_match == true
      beginner = gets.chomp.to_s
      name_match = true
      next if beginner == players[0]
  
      name_match = false
      if beginner == players[1]
        name_match = true
        players[0], players[1] = players[1], players[0]
        sym[0], sym[1] = sym[1], sym[0]
      else
        puts 'wrong input, Please insert correct player name: '
      end
    end
  
    puts "#{players[0]} will start'"
  
    moves_arr = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  
    while i < 9
  
      current_player = players[i % 2]
  
      puts "@ #{current_player.name}, now your turn. Pick a cell which has available spot: "
  
      print display_board(moves_arr)
  
      pick = gets.chomp.to_i - 1
  
      while (moves_arr[pick] != ' ') || !(0..10).cover?(pick)
  
        puts 'wrong input. Please pick another cell no.: '
        pick = gets.chomp.to_i - 1
  
      end
  
      moves_arr[pick] = sym[i % 2]
  
      print display_board(moves_arr)
  
      win_move = 9
  
      draw_move = 0
      draw_move = pick + 1 if i == 8
  
      game_flag = 0
  
      case pick.to_i
      when win_move - 1
        puts 'You made the winning move. You won!!!'
        game_flag = 1
      when draw_move - 1
        puts 'Game ends with draw result'
      else
        puts "You picked cell no. #{pick + 1}"
      end
  
      break unless game_flag.zero?
  
      i += 1
    end
  
    puts 'Game is over. Would you like to continuue? (Y) or quit? (N): '
  
    flag = gets.chomp.to_s
  
  end
  