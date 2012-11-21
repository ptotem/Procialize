class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :attendee_name
      t.integer :user_id

      t.timestamps
    end
  end
end
