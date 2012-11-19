class GrafitiWall < ActiveRecord::Base
  attr_accessible :attendee_id, :user_id, :wall_message

  belongs_to :attendee
  belongs_to :user

end
