class User < ApplicationRecord
    has_many :card_decks, dependent: :destroy
    #self.primary_key = "id"

    

end
