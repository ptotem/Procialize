class AddViewersNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :viewers_name, :text
  end
end
