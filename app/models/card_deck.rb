class CardDeck < ApplicationRecord
    belongs_to :user
    has_many :cards, class_name:'Card', foreign_key: 'deck_id', dependent: :destroy
    validates :id, presence: true, uniqueness: true
    validates :user_id, presence: true
    validates :name, presence: true
end
