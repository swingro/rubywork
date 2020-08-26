class HumanPlayer
    def initialize

    end

    def prompt
        p "Please imput coord of 2 3 type of the card you want to see"
    end

    def get_input  
       position = gets.chomp.split(" ")
        [position[0].to_i, position[1].to_i]
    end
end