class Message < ActiveRecord::Base
  attr_accessible :body, :name, :user_id, :conference_id


  has_many :receipients, :dependent => :destroy

  belongs_to :user
  belongs_to :conference

end
