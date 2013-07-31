class UserImport < ActiveRecord::Base
  attr_accessible :user_details

  has_attached_file :user_details
end
