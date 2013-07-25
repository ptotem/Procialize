class AddCheckingToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :checking, :boolean
  end
end
