class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.integer :conference_id
      t.integer :user_id

      t.timestamps
    end
  end
end
