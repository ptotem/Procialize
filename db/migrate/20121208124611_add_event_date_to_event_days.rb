class AddEventDateToEventDays < ActiveRecord::Migration
  def change
    add_column :event_days, :event_date, :date
  end
end
