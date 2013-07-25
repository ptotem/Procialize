class HomePageLogo < ActiveRecord::Base
  attr_accessible :image_eight, :image_five, :image_four, :image_nine, :image_one, :image_seven, :image_six, :image_ten, :image_three, :image_two,:event_image,:conference_image,:sponsor_image,:event_one_image,:event_two_image

  has_attached_file :image_one, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_two, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_three, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_four, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_five, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_six, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_seven, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_eight, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_nine, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image_ten, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :event_image, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :conference_image, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :sponsor_image, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :event_one_image, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :event_two_image, :styles => {:medium => "300x300>", :thumb => "100x100>"}


end
