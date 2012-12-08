class Message < ActiveRecord::Base
  attr_accessible :body, :name, :user_id, :conference_id, :receipients_attributes
  belongs_to :user
  belongs_to :conference
  has_many :receipients, :dependent => :destroy
  accepts_nested_attributes_for :receipients, :reject_if => proc { |attrs| reject = %w(user_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  validate :at_least_one_receipient

  def at_least_one_receipient
    if receipients.size < 1
      errors.add :base, "The message must have at least one receipient"
    end
  end

end
