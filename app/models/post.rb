class Post < ActiveRecord::Base
  attr_accessible :conference_id, :name, :user_id


  belongs_to :user
  belongs_to :conference

end
