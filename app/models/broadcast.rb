class Broadcast < ActiveRecord::Base
  attr_accessible :event_id, :organizer_id


  belongs_to :organizer
  belongs_to :event


  has_one :notice_board

end
