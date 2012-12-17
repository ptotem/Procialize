class AddMeetingIdToEventDay < ActiveRecord::Migration
  def change
    add_column :event_days, :meeting_id, :integer
  end
end
