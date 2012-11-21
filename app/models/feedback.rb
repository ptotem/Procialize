class Feedback < ActiveRecord::Base
  attr_accessible :attendee_id, :event_id, :feedback_details

  belongs_to :event
  belongs_to :attendee

end
