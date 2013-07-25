class AddLikesByToQuestionable < ActiveRecord::Migration
  def change
    add_column :questionables, :likes_by, :string
  end
end
