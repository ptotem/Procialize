class CreateQuestionables < ActiveRecord::Migration
  def change
    create_table :questionables do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :approved
      t.string :quest_name
      t.integer :up_votes
      t.integer :down_votes

      t.timestamps
    end
  end
end
