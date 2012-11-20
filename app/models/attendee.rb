class Attendee < ActiveRecord::Base
  attr_accessible :name, :user_id


  belongs_to :user


  has_many :feedbacks, :dependent => :destroy

  has_one :grafiti_wall

  has_many :messages,:dependent => :destroy
  has_many :meetings, :through => :messages

end