class AddPersonViewToUsers < ActiveRecord::Migration
  def change
    add_column :users, :person_view, :text
  end
end
