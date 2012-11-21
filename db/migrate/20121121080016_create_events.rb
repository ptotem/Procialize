class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :event_description
      t.string :event_location
      t.datetime :event_datetime
      t.integer :organizer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
