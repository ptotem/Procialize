class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :rate

      t.timestamps
    end
  end
end
