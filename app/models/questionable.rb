class Questionable < ActiveRecord::Base
  attr_accessible :approved, :down_votes, :event_id, :quest_name, :up_votes, :user_id ,:track_id

  #belongs_to :event
   belongs_to :track



end
