class RemoveViewFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :view
  end

  def down
    add_column :users, :view, :integer
  end
end
