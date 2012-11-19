class Profile < ActiveRecord::Base
  attr_accessible :interest, :name, :user_id

  belongs_to :user

end
