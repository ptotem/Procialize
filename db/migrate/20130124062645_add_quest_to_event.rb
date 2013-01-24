class AddQuestToEvent < ActiveRecord::Migration
  def change
    add_column :events, :quest, :boolean
  end
end
