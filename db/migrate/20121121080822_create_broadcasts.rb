class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.integer :event_id
      t.integer :organizer_id

      t.timestamps
    end
  end
end
