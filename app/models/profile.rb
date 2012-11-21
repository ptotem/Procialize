class Profile < ActiveRecord::Base
  attr_accessible :interest, :profile_name, :user_id

  belongs_to :user

end
