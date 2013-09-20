class ExhibitorImport < ActiveRecord::Base
  attr_accessible :exhibitor_details

  has_attached_file :exhibitor_details
end
