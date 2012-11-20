class CreateEveCalendars < ActiveRecord::Migration
  def change
    create_table :eve_calendars do |t|
      t.string :name
      t.integer :event_id

      t.timestamps
    end
  end
end
