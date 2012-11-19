class NoticeBoard < ActiveRecord::Base
  attr_accessible :board_message, :broadcast_id, :user_id

  belongs_to :broadcast
  belongs_to :user

end
