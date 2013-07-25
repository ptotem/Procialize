class Track < ActiveRecord::Base
  attr_accessible :description, :end, :event_id, :name, :start, :track_img,:event_attributes,:questionables_attributes,:rating_attributes

  has_attached_file :track_img, :styles => {:medium => "300x300>", :thumb => "100x100>"}

  has_many :attendees, :dependent => :destroy
  has_many :questionables, :dependent => :destroy
  has_one  :rating,:dependent => :destroy
  belongs_to :event
  belongs_to :event_day
end
