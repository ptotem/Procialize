class AddHideToQuestionable < ActiveRecord::Migration
  def change
    add_column :questionables, :hide, :boolean
  end
end
