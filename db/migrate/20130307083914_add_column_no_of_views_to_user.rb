class AddColumnNoOfViewsToUser < ActiveRecord::Migration
  def change
    add_column :users, :no_of_views, :integer ,:default => 0
  end
end
