class ExhibitorUserImport < ActiveRecord::Base
  attr_accessible :exhibitor_user_details

  has_attached_file :exhibitor_user_details
end
