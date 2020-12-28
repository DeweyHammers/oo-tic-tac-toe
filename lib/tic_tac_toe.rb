class TicTacToe
    
    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Left row
        [1,4,7], # Middle row
        [2,5,8], # Right row
        [0,4,8], # Left diagonal
        [2,4,6]  # Right diagonal
    ]

    def initialize
        @board = Array.new(9, " ") 
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input = input.to_i
        input -= 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        /[XO]/.match(@board[index]) ? true : false
    end

    def valid_move?(index)
        if 9 > index && index > -1
            position_taken?(index) ? false : true
        end
    end

    def turn_count
        @board.join("").split.length
    end

    def current_player
        turn_count.odd? ? "O" : "X"
    end

    def turn 
        print "Please enter 1-9: "
        user_input = gets.chomp
        input = input_to_index(user_input)
        if valid_move?(input)  
            @board[input] = current_player 
            display_board
        else
            turn
        end
    end

    def won?
        board_compo = nil 
        WIN_COMBINATIONS.map do |combo|
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
            board_compo = combo
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            board_compo = combo
          end
        end
        board_compo
    end
end