class Questionable < ActiveRecord::Base
  attr_accessible :approved, :down_votes, :event_id, :quest_name, :up_votes, :user_id ,:event_attributes

  belongs_to :event




end
