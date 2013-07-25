class Rating < ActiveRecord::Base
  attr_accessible :event_id, :rate, :user_id,:track_id


  belongs_to :user
  #belongs_to :event
  belongs_to :track
end
