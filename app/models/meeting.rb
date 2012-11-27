class Meeting < ActiveRecord::Base
  attr_accessible :end_time, :location, :name, :start_time

  has_many :meeters, :dependent => :destroy
  has_many :users, :through => :meeters

  belongs_to :user

end
