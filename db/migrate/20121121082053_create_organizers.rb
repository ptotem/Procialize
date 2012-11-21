class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :organizer_name
      t.integer :user_id

      t.timestamps
    end
  end
end
