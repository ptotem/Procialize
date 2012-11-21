class Location < ActiveRecord::Base
  attr_accessible :meeting_id, :name

  has_many :event_locations ,:dependent => :destroy
  has_many :events,:through => :event_locations

  belongs_to :meeting

end
