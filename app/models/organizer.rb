class Organizer < ActiveRecord::Base
  attr_accessible :organizer_name, :user_id

  has_many :events , :dependent => :destroy
  has_many :broadcast , :dependent => :destroy

  belongs_to :user

end
