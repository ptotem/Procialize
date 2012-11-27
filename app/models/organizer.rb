class Organizer < ActiveRecord::Base
  attr_accessible :conference_id, :user_id
  belongs_to :user
  belongs_to :conference
end
