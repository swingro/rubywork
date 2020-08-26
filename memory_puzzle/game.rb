require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game

    def initialize
        @board = Board.new
        @board.populate
        @previously_guessed_position = []
        @player = HumanPlayer.new
    end

    def play
        i = 0

        
        while !@board.won?
            
            system("clear")
            puts " number of moves = #{i}"
            @board.render
            @player.prompt
            guessed_position = @player.get_input
            @board[guessed_position].reveal
            system("clear")
            @board.render
            @player.prompt
            @previously_guessed_position = guessed_position
            guessed_position = @player.get_input
            @board[guessed_position].reveal
            system("clear")
            @board.render
        
            sleep(5)
            if !(@board[@previously_guessed_position]==@board[guessed_position])
               @board[@previously_guessed_position].hide
               @board[guessed_position].hide
                
            end
           
         i += 1
        end
        puts " You won in #{i} moves"
    end

end

game = Game.new

game.play