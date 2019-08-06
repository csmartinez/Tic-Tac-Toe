# Tic-tac-toe game written by Carli Martinez on August 5, 2019
# Ruby version 2.5.3
# To run this program: $ ruby game.rb

def check_winner(board, user_piece)
	if board["A1"] == board["B1"] && board["B1"] == board["C1"]
		if board["A1"] == user_piece
			display_board(board)
			puts "You win!"
			return true
		elsif board["A1"] != " "
			display_board(board)
			puts "You lost!"
			return true
		end
	end

	if board["A2"] == board["B2"] && board["B2"] == board["C2"]
		if board["A2"] == user_piece
			display_board(board)
			puts "You win!"
			return true
		elsif board["A2"] != " "
			display_board(board)
			puts "You lost!"
			return true
		end
	end

	if board["A3"] == board["B3"] && board["B3"] == board["C3"]
		if board["A3"] == user_piece
			display_board(board)
			puts "You win!"
			return true
		elsif board["A3"] != " "
			display_board(board)
			puts "You lost!"
			return true
		end
	end

	if board["A1"] == board["A2"] && board["A2"] == board["A3"]
		if board["A1"] == user_piece
			display_board(board)
			puts "You win!"
			return true
		elsif board["A1"] != " "
			display_board(board)
			puts "You lost!"
			return true
		end
	end

	if board["B1"] == board["B2"] && board["B2"] == board["B3"]
		if board["B1"] == user_piece
			display_board(board)
			puts "You win!"
			return true
		elsif board["B1"] != " "
			display_board(board)
			puts "You lost!"
			return true
		end
	end

	if board["C1"] == board["C2"] && board["C2"] == board["C3"]
		if board["C1"] == user_piece
			display_board(board)
			puts "You win!"
			return true
		elsif board["C1"] != " "
			display_board(board)
			puts "You lost!"
			return true
		end
	end

	if board["A1"] == board["B2"] && board["B2"] == board["C3"]
		if board["A1"] == user_piece
			display_board(board)
			puts "You win!"
			return true
		elsif board["A1"] != " "
			display_board(board)
			puts "You lost!"
			return true
		end
	end

	if board["A3"] == board["B2"] && board["B2"] == board["C1"]
		if board["A3"] == user_piece
			display_board(board)
			puts "You win!"
			return true
		elsif board["A3"] != " "
			display_board(board)
			puts "You lost!"
			return true
		end
	end

	if board.has_value?(" ") == false
		display_board(board)
		puts "Draw! No winners!"
		return true
	end

	return false

end

def display_board(board)
	puts "       A   B   C"
	puts "     +---+---+---+"
	puts "  1  | " + board["A1"] + " | " + board["B1"] + " | " + board["C1"] + " |"
	puts "     +---+---+---+"
	puts "  2  | " + board["A2"] + " | " + board["B2"] + " | " + board["C2"] + " |"
	puts "     +---+---+---+"
	puts "  3  | " + board["A3"] + " | " + board["B3"] + " | " + board["C3"] + " |"
	puts "     +---+---+---+"
end

def pick_position(user_piece, pc_piece)
	solved = false
	board = {"A1" => " ", "A2" => " ", "A3" => " ",
					"B1" => " ", "B2" => " ","B3" => " ",
					"C1" => " ", "C2" => " ", "C3" => " "}

	while solved == false do
		display_board(board)
		puts "Where do you want to move?"
		position = " "

		loop do # Get a valid user input position
			position = gets.upcase.chomp

			if position[0] == 'A' || position[0] == 'B' || position[0] == 'C'
				if position[1] != '1' || position[1] != '2' || position[1] != '3'
					if board[position] != " "
						puts "Space Occupied! Where do you want to move?"
					else
						break
					end
				else
					puts "Invalid Position"
				end
			else
				puts "Invalid Position"
			end
		end # End Loop

		board[position] = user_piece # Set player piece

		empty_positions = board.values.count(" ") # Count empty spaces
		random_position = rand(empty_positions) # Set random number to represent random space
		counter = 0

		board.each do |position, user_piece| # Loop through board
			if board[position] == " "
				if counter == random_position
					if pc_piece == 0
						board[position] = 'O'
						break
					elsif pc_piece == 1
						board[position] = 'X'
						break
					end # End PC_piece check
				end # End counter reached random position check
				counter = counter + 1
			end # End empty space loop

		end # End Board Loop

		solved = check_winner(board, user_piece)

	end # End While

	puts "Game Over!"
end # End Function


puts "Which player do you want to be? X or O?"

loop do # Get valid player piece input
	user_piece = gets.downcase.chomp
	if user_piece.include?('x')
		pick_position('X', 0) # Send player piece and pc piece (0 = 'O')
		break
	elsif user_piece.include?('o')
		pick_position('O', 1) # Send player piece and pc piece (1 = 'X')
		break
	else
			puts "Please enter either X or O"
	end
end
