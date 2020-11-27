![](https://img.shields.io/badge/Microverse-blueviolet)

# Tic-Tac-Toe 
This project is building a 3 by 3 board Tic-Tac-Toe game using Ruby and OOP concept. The project is divided into four milestones. They are Project setup, user interface, game logic and game instructions, each with dedicated git  branches to be merged to the default development branch.  

## Description 
The project has two folders namely bin and lib, in addition to the root directory. The bin folder is the one which holds the executable file, 'main'. The lib folder is the one which holds all the library files that have all the game classes and methods. 
- main.rb file is reponsible for user interaction, and all the puts and gets are written here but nowhere else. It is setup to be executable and it does not have the .rb extension. Call commands to the lib files are written at the top of these file. 

## Instruction 
### About the Game 
Tic-Tac-Toe is a game played by two players. It has a board with different sizes in general, but this particular game has 3 by 3 spots board as shown below. 

1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9

The players will choose their own symbols and make moves alternatively and to win the game the player should make horizonal or vertical or diagonal pattern with his symbol first. The winning conditions are:
X | X | X
---------
4 | 5 | 6
---------
7 | 8 | 9
_______________

1 | 2 | 3
---------
X | X | X
---------
7 | 8 | 9
_______________

1 | 2 | 3
---------
4 | 5 | 6
---------
X | X | X 
_______________

X | 2 | 3
---------
X | 5 | 6
---------
X | 8 | 9 
_______________

1 | X | 3
---------
4 | X | 6
---------
7 | X | 9

_______________

1 | 2 | X
---------
4 | 5 | X
---------
7 | 8 | X

_______________

X | 2 | 3
---------
4 | X | 6
---------
7 | 8 | X
_______________

1 | 2 | X
---------
4 | X | 6
---------
X | 8 | 9


### Starting the game 

The game can be played on terminal. To start the game just type 'ruby bin/main' on terminal and a welcome message pops up followed by instruction to begin the game. 

### Step by step guide 

1. Once the game starts the game object is created and the game asks players to enter the players names.
    
    $ ruby bin/main
    Hi, Welcome to TicTacToe game
    Insert name of two players: 

2. The players should feed valid player names, other wise error message will pop out until valid names are given. Names should have more than one character and cannot start with number
    
    Henok
    Nikola

3. Once the name of the two players are given the game creates player objects and displays welcome message for the players      
   
    Hi Henok and Nikola, welcome to tictactoe game: 
    1 | 2 | 3 
    ---------- 
    4 | 5 | 6 
    ---------- 
    7 | 8 | 9

4. Then the gams asks each player to choose their symbols. If the symbols are not valid the game displays error message. Numbers and more than one character is not allowed in the game.  
    
    Ok Henok please pick your symbol: 
    X
    Ok Nikola please pick your symbol: 
    O

5. Game assigns the input symbols to the respective player objects and displays message which asks players to choose the beginner. 
    
    Henok choses X
    Nikola choses O
    Game is ready. Now pick the player for the first move:

6. One of the players input their name to begin. If players enter a name different from the creater player objects names, the game will display error message. At this point only one of the players names can be accepted.
    
    Nikola

6. The game accepts the input and sets the beginner, and asks the chosen beginner to pick a cell from displayed board. 
Nikola will start'
    
    @ Nikola, now your turn. Pick a cell which has available spot: 
    1 | 2 | 3 
    ---------- 
    4 | 5 | 6 
    ---------- 
    7 | 8 | 9

7. The player picks his/her cell by using number index. The number index of each cell is shown in the About the game section. The player can only pick index number from 1 to 9 only, other wise the game will display error message until valid input is given. 
    
    1

8. The game accepts the player input and updates the board and displays it to the player
    
    You picked cell no. 1
    O | 2 | 3 
    ---------- 
    4 | 5 | 6 
    ---------- 
    7 | 8 | 9

9. The game asks the next player to make a move while displaying the current board 
    
    @ Henok, now your turn. Pick a cell which has available spot: 
    O | 2 | 3 
    ---------- 
    4 | 5 | 6 
    ---------- 
    7 | 8 | 9

10. Now the next player picks available cell using the index number left. Picking already occupied cell will invoke error message until the player picks available spot. The game displays the current board to teh player so that the current player can see what available spots are there. 
    5
11. Once the player make move the game will check if teh move is valid and it updates the board and displays it. 
    
    You picked cell no. 5
    O | 2 | 3 
    ---------- 
    4 | 5 | 6 
    ---------- 
    7 | 8 | 9

12. The game continues with the same loop with maximum  of 9 as described above until three conditions are met: 
    a) Game ends with win result (refer win conditions in the about the game section)
    b) Game ends with draw result (will be discussed in section below)

### Game logic 

The game loops through the same game steps until game over condition is met. The maximum possible loop is 9 when there is no win or draw conditions are met earier. 

At the end of every loop step, the game checks if either win or draw conditions are met.

Winning move: As described in the about section, the winning move is achieved when horizontal, vertical or diagonal full patterns are made by a players symbol as demonstrated below. In this case the game declares the winner and displayes a message the game is over. 
    
    6
    You made the winning move. You won!!!
    O | 2 | O 
    ---------- 
    X | X | X 
    ---------- 
    7 | O | 9
    Game is over. Would you like to continue? (Y) or quit? (N): 

Draw move: The game also checks if there is no more winning conditions can be achieved in the subsequent steps. The game starts to check if move will cause draw result when two spots are left in the game. 

    Game ends with draw result
    O | X | 3 
    ---------- 
    X | O | O 
    ---------- 
    7 | O | X
    Game is over. Would you like to continue? (Y) or quit? (N): 

As demonstrated in the example above, even though the game has two more spots to play with, there will be no winning condition, no matter what moves the players make subsequently. Therefore, the game declares the game end s with draw result. 
Finally, after game is over, the game will give option if plpayers can repeat the game or quit 
    
    Game is over. Would you like to continue? (Y) or quit? (N): 

## Built With

- Ruby
- VS code

## Getting Started

### Prerequisites

- Ruby

## Setup

**Run the code demonstrations below**

```bash
main 
```

## Authors

👤 **Nikola Zdarle**

- GitHub: [@zdrale ](https://github.com/zdrale)
- Twitter: [@zdralenikola]https://twitter.com/zdralenikola)
- LinkedIn: [Nikola Zdrale ](https://www.linkedin.com/in/nikola-zdrale/)

👤 **Henok Mossissa**

- GitHub: [@henatan99](https://github.com/henatan99)
- Twitter: [@henatan99](https://twitter.com/henatan99)
- LinkedIn: [Henok Mossissa](https://www.linkedin.com/in/henok-mekonnen-2a251613/)

## :handshake: Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a :star:️ if you like this project!

## :memo: License

This project is [MIT](./LICENSE) licensed.
