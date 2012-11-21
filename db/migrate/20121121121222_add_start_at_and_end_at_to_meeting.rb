class AddStartAtAndEndAtToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :start_at, :datetime
    add_column :meetings, :end_at, :datetime
  end
end
