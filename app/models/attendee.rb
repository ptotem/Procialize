class Attendee < ActiveRecord::Base
  attr_accessible :event_id, :feedback, :user_id,:track_id

  belongs_to :user
  belongs_to :track
  #belongs_to :event

end
