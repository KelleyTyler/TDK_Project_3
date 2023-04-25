class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.text :card_q
      t.text :card_a
      #t.timestamps
    end
    #add_reference :deck_id, :card_deck, foreign_key: true
    #add_foreign_key :deck_id, :card_decks
  end
end
