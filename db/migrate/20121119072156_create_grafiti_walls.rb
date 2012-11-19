class CreateGrafitiWalls < ActiveRecord::Migration
  def change
    create_table :grafiti_walls do |t|
      t.text :wall_message
      t.integer :attendee_id
      t.integer :user_id

      t.timestamps
    end
  end
end
