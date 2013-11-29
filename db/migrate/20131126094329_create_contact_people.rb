class CreateContactPeople < ActiveRecord::Migration
  def change
    create_table :contact_people do |t|
      t.string :name
      t.string :designation
      t.text :address
      t.text :phone_no

      t.timestamps
    end
  end
end
