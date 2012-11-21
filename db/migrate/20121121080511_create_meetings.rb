class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :meeting_name
      t.text :meeting_description
      t.string :meeting_location
      t.datetime :meeting_datetime
      t.integer :user_id

      t.timestamps
    end
  end
end
