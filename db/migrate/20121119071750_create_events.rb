class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :organizer_id

      t.timestamps
    end
  end
end
