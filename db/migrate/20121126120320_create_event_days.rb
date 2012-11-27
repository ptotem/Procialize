class CreateEventDays < ActiveRecord::Migration
  def change
    create_table :event_days do |t|
      t.string :name
      t.integer :conference_id
      t.integer :sequence

      t.timestamps
    end
  end
end
