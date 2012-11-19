class Event < ActiveRecord::Base
  attr_accessible :name, :organizer_id



  belongs_to :organizer

  has_many :feedbacks, :dependent => :destroy
  has_many :decks , :dependent => :destroy
  has_many :speakers , :dependent => :destroy
  has_many :broadcasts , :dependent => :destroy

  has_many :event_locations ,:dependent => :destroy
  has_many :locations,:through => :event_locations

end
