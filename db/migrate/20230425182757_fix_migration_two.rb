class FixMigrationTwo < ActiveRecord::Migration[7.0]
  def change
    add_column :card_decks, :user_id, :integer
    #add_column :cards, :deck_id, :integer
    add_foreign_key :card_decks, :users, column: :user_id
    add_foreign_key :cards, :card_decks, column: :deck_id
  end
end
