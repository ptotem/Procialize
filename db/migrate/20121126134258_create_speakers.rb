class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
