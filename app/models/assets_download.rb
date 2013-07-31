class AssetsDownload < ActiveRecord::Base
  attr_accessible :downloadable, :track_id
  has_attached_file :downloadable, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  #belongs_to :event
  belongs_to :track
end
