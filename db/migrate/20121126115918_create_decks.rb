class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.integer :event_id

      t.timestamps
    end
  end
end
