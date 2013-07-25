class RemoveLikesByFromQuestionable < ActiveRecord::Migration
  def up
    remove_column :questionables, :likes_by
  end

  def down
    add_column :questionables,  :likes_by
  end
end
