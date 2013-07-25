class CreateAssetsDownloads < ActiveRecord::Migration
  def change
    create_table :assets_downloads do |t|
      t.has_attached_file :downloadable
      t.integer :event_id

      t.timestamps
    end
  end
end
