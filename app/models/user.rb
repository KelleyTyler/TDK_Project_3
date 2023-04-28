class User < ApplicationRecord
    has_many :card_decks, dependent: :destroy
    #self.primary_key = "id"
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :role, presence: true

    def authenticate(pword)
        puts "_-----------000000000"
        puts "AUTHENTICATING: #{pword} vs #{self.password}"
        pword == self.password
    end
    def postStuff()
        puts "USERNAME: #{self.username}"
        puts "PASSWORD: #{self.password}" 
    end
end
