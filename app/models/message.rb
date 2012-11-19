class Message < ActiveRecord::Base
  attr_accessible :attendee_id, :meeting_id, :message_details

  belongs_to :attendee
  belongs_to :meeting

end
