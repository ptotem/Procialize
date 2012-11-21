class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :feedback_details
      t.integer :event_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
