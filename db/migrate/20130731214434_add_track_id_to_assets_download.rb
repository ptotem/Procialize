class AddTrackIdToAssetsDownload < ActiveRecord::Migration
  def change
    add_column :assets_downloads, :track_id, :integer
  end
end
