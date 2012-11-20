class Event < ActiveRecord::Base
  attr_accessible :name, :organizer_id ,:user_id

  #has_event_calendar



  belongs_to :organizer
  belongs_to :user

  has_many :feedbacks, :dependent => :destroy
  has_many :decks , :dependent => :destroy
  has_many :speakers , :dependent => :destroy
  has_many :broadcasts , :dependent => :destroy

  has_many :event_locations ,:dependent => :destroy
  has_many :locations,:through => :event_locations

  has_event_calendar :start_at  => '2012-10-1', :end_at => '2050-12-31'

end
