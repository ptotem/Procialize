class AddLikeToQuestionable < ActiveRecord::Migration
  def change
    add_column :questionables, :like, :integer,:default => 0
  end
end
