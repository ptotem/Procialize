class RemoveLikesFromQuestionable < ActiveRecord::Migration
  def up
    remove_column :questionables, :likes
  end

  def down
    add_column :questionables, :likes, :integer
  end
end
