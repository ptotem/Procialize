class Deck < ActiveRecord::Base
  attr_accessible :event_id, :name

  belongs_to :event

end
