class AddTrackIdToQuestionable < ActiveRecord::Migration
  def change
    add_column :questionables, :track_id, :integer
  end
end
