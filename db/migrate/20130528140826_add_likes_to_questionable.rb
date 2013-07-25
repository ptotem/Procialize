class AddLikesToQuestionable < ActiveRecord::Migration
  def change
    add_column :questionables, :likes, :integer
  end
end
