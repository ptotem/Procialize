class AddTrackingIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :tracking_id, :integer
  end
end
