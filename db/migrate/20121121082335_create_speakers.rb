class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :speaker_name
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
