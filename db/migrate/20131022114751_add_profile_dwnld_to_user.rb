class AddProfileDwnldToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_dwnld, :text
  end
end
