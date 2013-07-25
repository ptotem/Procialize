class AddThemesToUser < ActiveRecord::Migration
  def change
    add_column :users, :themes, :integer ,:default => 0
  end
end
