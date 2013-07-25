class AddTrackIdToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :track_id, :integer
  end
end
