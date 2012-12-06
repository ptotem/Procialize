class Follower < ActiveRecord::Base
  attr_accessible :follower_id, :user_id, :conference_id
  belongs_to  :user
  belongs_to  :conference

end
