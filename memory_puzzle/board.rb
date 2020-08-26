require_relative "card.rb"

class Board
    CARDS = ["Q", "P", "R", "S","T", "V", "X", "Z", "Q", "P", "R", "S","T", "V", "X", "Z"]

    def initialize
        @grid = Array.new(4){[]}
        
    end
    
    def populate    
        i = 1
        size = @grid.length
        while i <= (size  * size)
            x = rand(0...size)
            y = rand(0...size)
            if !@grid[x][y].instance_of?(Card)
                @grid[x][y] = Card.new(CARDS[i - 1])
                i += 1
            end
        end

    end


    def render
        puts "  0 1 2 3"
        puts "0 #{@grid[0][0].display_card_info} #{@grid[0][1].display_card_info} #{@grid[0][2].display_card_info} #{@grid[0][3].display_card_info}"
        puts "1 #{@grid[1][0].display_card_info} #{@grid[1][1].display_card_info} #{@grid[1][2].display_card_info} #{@grid[1][3].display_card_info}"
        puts "2 #{@grid[2][0].display_card_info} #{@grid[2][1].display_card_info} #{@grid[2][2].display_card_info} #{@grid[2][3].display_card_info}"
        puts "3 #{@grid[3][0].display_card_info} #{@grid[3][1].display_card_info} #{@grid[3][2].display_card_info} #{@grid[3][3].display_card_info}"
    end

    def won?
        @grid.all? do |row|
            row.all? do |col|
                col.display_card_info != " "
            end
        end
    end
    def [](position)
        x, y = position
        @grid[x.to_i][y.to_i]
    end

    def reveal(guessed_pos)
        @grid[guessed_pos].reveal   
    end

end