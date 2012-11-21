class RemoveEventDatetimeFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :event_datetime
  end

  def down
    add_column :events, :event_datetime, :datetime
  end
end
