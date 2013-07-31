class TrackSpeaker < ActiveRecord::Base
  attr_accessible :speaker_id, :track_id

  belongs_to :track
  belongs_to :speaker

end
