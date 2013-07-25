class AddLikingByToQuestionable < ActiveRecord::Migration
  def change
    add_column :questionables, :liking_by, :string,:default => 0
  end
end
