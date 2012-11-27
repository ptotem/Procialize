class Deck < ActiveRecord::Base
  attr_accessible :event_id


  belongs_to :event

  has_attached_file :avatar

end
