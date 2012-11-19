class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :event_id
      t.integer :attendee_id
      t.text :feedback_details

      t.timestamps
    end
  end
end
