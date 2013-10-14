class AddViewersNameToExhibitor < ActiveRecord::Migration
  def change
    add_column :exhibitors, :viewers_name, :text
  end
end
