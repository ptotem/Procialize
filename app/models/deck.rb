class Deck < ActiveRecord::Base
  attr_accessible :deck_name, :event_id


  belongs_to :event

end
