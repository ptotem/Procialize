class ViewerToAssetsdownload < ActiveRecord::Migration
  def change
    add_column :assets_downloads, :viewer, :text
  end
end
