class Speaker < ActiveRecord::Base
  attr_accessible :event_id, :user_id,:avatar,:name,:speaker_details
  belongs_to :event
  belongs_to :user


  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}
end
