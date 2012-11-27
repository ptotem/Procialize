class EventDay < ActiveRecord::Base
  attr_accessible :conference_id, :name, :sequence


  has_many :events, :dependent => :destroy

  belongs_to :conference

end
