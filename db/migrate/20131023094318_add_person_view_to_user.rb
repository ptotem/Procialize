class AddPersonViewToUser < ActiveRecord::Migration
  def change
    add_column :users, :person_view, :text
  end
end
