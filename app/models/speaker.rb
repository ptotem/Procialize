class Speaker < ActiveRecord::Base
  attr_accessible  :user_id,:avatar,:name,:speaker_details,:tracks_attributes

  has_many :track_speakers,:dependent => :destroy
  has_many :tracks,:through => :track_speakers



  #belongs_to :event
  belongs_to :user



  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}
end
