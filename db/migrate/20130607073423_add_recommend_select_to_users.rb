class AddRecommendSelectToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recommend_select, :boolean,:default => false
  end
end
