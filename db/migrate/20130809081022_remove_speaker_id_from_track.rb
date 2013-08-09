class RemoveSpeakerIdFromTrack < ActiveRecord::Migration
  def up
    remove_column :tracks, :speaker_id
  end

  def down
    add_column :tracks, :speaker_id, :integer
  end
end
