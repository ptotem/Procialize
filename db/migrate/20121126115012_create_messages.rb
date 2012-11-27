class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.text :body
      t.integer :user_id
      t.integer :conference_id

      t.timestamps
    end
  end
end
