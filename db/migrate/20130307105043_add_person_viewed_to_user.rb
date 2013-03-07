class AddPersonViewedToUser < ActiveRecord::Migration
  def change
    add_column :users, :person_viewed, :string
  end
end
