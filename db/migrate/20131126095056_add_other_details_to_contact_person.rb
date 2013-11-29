class AddOtherDetailsToContactPerson < ActiveRecord::Migration
  def change
    add_column :contact_people, :other_details, :text
  end
end
