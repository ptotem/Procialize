class Attendee < ActiveRecord::Base
  attr_accessible :attendee_name, :user_id,:event_id

  belongs_to :user


  has_many :feedbacks, :dependent => :destroy

  has_one :grafiti_wall

  has_many :messages,:dependent => :destroy
  has_many :meetings, :through => :messages


end
