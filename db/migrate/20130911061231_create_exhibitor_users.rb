class CreateExhibitorUsers < ActiveRecord::Migration
  def change
    create_table :exhibitor_users do |t|
      t.integer :exhibitor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
