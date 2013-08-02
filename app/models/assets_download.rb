class AssetsDownload < ActiveRecord::Base
  attr_accessible :downloadable, :track_id
  belongs_to :track
  has_attached_file :downloadable, :content_type => ["application/xls","application/xlsx","application/pdf","image/png","image/jpg"]


end
