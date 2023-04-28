class CardDeck < ApplicationRecord
    belongs_to :user
    has_many :cards, dependent: :destroy
    validates :id, presence: true, uniqueness: true
    validates :user_id, presence: true
    validates :name, presence: true
end
