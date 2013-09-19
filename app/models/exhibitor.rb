class Exhibitor < ActiveRecord::Base
  attr_accessible :brouchers, :description, :exhi_logo, :industry, :name, :stall_no

  has_attached_file :brouchers, :content_type => ["application/xls","application/xlsx","application/pdf","image/png","image/jpg"]
  has_attached_file :exhi_logo


 has_many :exhibitor_users,:dependent => :destroy
 has_many :users,:through => :exhibitor_users

end
