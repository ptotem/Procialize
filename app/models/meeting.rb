class Meeting < ActiveRecord::Base
  attr_accessible :meeting_datetime, :meeting_description, :meeting_location, :meeting_name, :user_id,:start_at,:end_at

  belongs_to :user

  has_many :messages ,:dependent => :destroy
  has_many :attendees ,:through => :messages

  has_event_calendar :start_at => '2012-10-1', :end_at => '2050-12-31'

end
