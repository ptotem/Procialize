class AddContactNoToExhibitor < ActiveRecord::Migration
  def change
    add_column :exhibitors, :contact_no, :text
  end
end
