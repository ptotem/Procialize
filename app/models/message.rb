class Message < ActiveRecord::Base
  attr_accessible :body, :name, :user_id, :conference_id
  has_many :receipients, :dependent => :destroy
  accepts_nested_attributes_for :receipients

  belongs_to :user
  belongs_to :conference

end
