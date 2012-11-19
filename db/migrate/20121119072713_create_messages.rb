class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message_details
      t.integer :attendee_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
