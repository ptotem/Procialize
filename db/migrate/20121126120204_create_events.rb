class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :start
      t.datetime :end
      t.integer :event_day_id

      t.timestamps
    end
  end
end
