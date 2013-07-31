class AddSpeakerIdToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :speaker_id, :integer
  end
end
