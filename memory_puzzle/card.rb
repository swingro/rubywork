class Card

  attr_reader :face_value
def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def display_card_info 
        if @face_up == true
            return @face_value
        else
            return " "
        end
    end

    def reveal
        @face_up = true
        @face_value
    end

    def to_s
        return @face_value.to_s
    end

    def == (other_card) 
        self.face_value == other_card.face_value
    end
end