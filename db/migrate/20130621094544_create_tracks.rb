class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :event_id
      t.string :name
      t.text :description
      t.datetime :start
      t.datetime :end
      t.has_attached_file :track_img

      t.timestamps
    end
  end
end
