class Event < ActiveRecord::Base
  attr_accessible :description, :end, :event_day_id, :name, :start ,:avatar


  has_many :decks, :dependent => :destroy
  has_many :attendees, :dependent => :destroy
  has_many :event_locations, :dependent => :destroy
  has_many :speakers, :dependent => :destroy
  has_attached_file :avatar

  belongs_to :event_day

end
