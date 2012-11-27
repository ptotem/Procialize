class Location < ActiveRecord::Base
  attr_accessible :conference_id, :name


  has_many :event_locations, :dependent => :destroy

  belongs_to :conference

end
