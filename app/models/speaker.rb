class Speaker < ActiveRecord::Base
  attr_accessible :event_id, :speaker_name, :user_id

  belongs_to :event
  belongs_to :user
end
