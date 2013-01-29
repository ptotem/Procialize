class AddSpeakerDetailsToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :speaker_details, :text
  end
end
