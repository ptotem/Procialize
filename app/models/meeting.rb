class Meeting < ActiveRecord::Base
  attr_accessible :location, :meeting_details, :name

  has_many :messages ,:dependent => :destroy
  has_many :attendees ,:through => :messages

end
