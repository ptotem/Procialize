class AddEventDayIdToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :event_day_id, :integer
  end
end
