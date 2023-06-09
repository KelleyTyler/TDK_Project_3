class Card < ApplicationRecord
    #belongs_to :card_deck
    has_one  :card_deck
    validates :id, presence: true, uniqueness: true
    validates :card_q, presence: true
    validates :card_a, presence: true
    validates :deck_id, presence: true
end
