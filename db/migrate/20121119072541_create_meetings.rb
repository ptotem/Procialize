class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :location
      t.text :meeting_details

      t.timestamps
    end
  end
end
