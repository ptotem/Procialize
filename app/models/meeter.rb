class Meeter < ActiveRecord::Base
  attr_accessible :meeting_id, :status, :user_id
  belongs_to :meeting
  belongs_to :user
  delegate :name, :to=>:user

end
