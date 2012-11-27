class Conference < ActiveRecord::Base
  attr_accessible :description, :name, :starting, :ending


  has_many :locations, :dependent => :destroy
  has_many :event_days, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :statuses, :dependent => :destroy
  has_many :followers, :dependent => :destroy
  has_many :organizers, :dependent => :destroy
  has_many :participants, :dependent => :destroy
  has_many :posts,:dependent => :destroy

end
