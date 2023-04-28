class Card < ApplicationRecord
    belongs_to :deck_id, class_name: 'CardDeck', foreign_key: 'deck_id'
    #has_one :card_deck
    validates :id, presence: true, uniqueness: true
    validates :card_q, presence: true
    validates :card_a, presence: true
    validates :deck_id, presence: true
end
