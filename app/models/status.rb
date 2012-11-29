class Status < ActiveRecord::Base
  attr_accessible :comment, :user_id

  belongs_to :user

end
