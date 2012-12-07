class Meeting < ActiveRecord::Base
  attr_accessible :end_time, :location, :name, :start_time ,:user_id,:meeters_attributes

  has_many :meeters, :dependent => :destroy
  has_many :users, :through => :meeters
  accepts_nested_attributes_for :meeters, :reject_if => proc { |attrs| reject = %w(user_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  belongs_to :user

end
