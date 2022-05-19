def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    (input.to_i)-1
end
  
def move(array, index, value = "X")
    array[index] = value
    puts array
end

def position_taken?(board, index)
    if board[index] == " " or 
        board[index] == "" or 
        board[index] == nil 
        false 
    elsif board[index] == "X" or 
        board[index] == "O"
        true
    end
end

def valid_move?(board, index)
    if index >= 9 or 
        index <= -1
        false
    elsif position_taken?(board, index) == false 
        true
    elsif position_taken?(board, index) == true
        false
    end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index) == true
        move(board, index, value = "X")
    elsif valid_move?(board, index) == false
        until valid_move?(board, index) == true
         puts "Please enter 1-9:"
         input = gets.strip
         index = input_to_index(input)
         valid_move?(board, index)
        end
        move(board, index, value = "X")
    end
    display_board(board)
end

