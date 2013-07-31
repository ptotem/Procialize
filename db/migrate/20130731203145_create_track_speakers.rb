class CreateTrackSpeakers < ActiveRecord::Migration
  def change
    create_table :track_speakers do |t|
      t.integer :track_id
      t.integer :speaker_id

      t.timestamps
    end
  end
end
