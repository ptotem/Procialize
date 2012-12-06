class Message < ActiveRecord::Base
  attr_accessible :body, :name, :user_id, :conference_id, :receipients_attributes
  has_many :receipients, :dependent => :destroy
  accepts_nested_attributes_for :receipients, :reject_if => proc { |attrs| reject = %w(user_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  belongs_to :user
  belongs_to :conference

end
