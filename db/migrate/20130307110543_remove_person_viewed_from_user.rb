class RemovePersonViewedFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :person_viewed
  end

  def down
    add_column :users, :person_viewed, :string
  end
end
