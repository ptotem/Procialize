class Logos < ActiveRecord::Base
  attr_accessible :cheif_sponsor, :oragnizer_pic, :splash_pic
  has_attached_file :cheif_sponsor
  has_attached_file :oragnizer_pic
  has_attached_file :splash_pic
end
