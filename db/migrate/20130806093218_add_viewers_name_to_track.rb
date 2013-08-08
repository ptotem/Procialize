class AddViewersNameToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :viewers_name, :text
  end
end
