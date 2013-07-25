class AddTrackIdToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :track_id, :integer
  end
end
