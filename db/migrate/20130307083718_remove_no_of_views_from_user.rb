class RemoveNoOfViewsFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :no_of_views
  end

  def down
    add_column :users, :no_of_views, :integer
  end
end
