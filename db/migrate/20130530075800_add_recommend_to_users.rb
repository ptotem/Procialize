class AddRecommendToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recommend, :string
  end
end
