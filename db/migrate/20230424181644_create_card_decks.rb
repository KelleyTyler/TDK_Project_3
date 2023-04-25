class CreateCardDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :card_decks do |t|
      t.integer :usr_id
      t.string :name

      #t.timestamps
    end
    #add_foreign_key :user_id, :users
  end
end
