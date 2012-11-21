class NoticeBoard < ActiveRecord::Base
  attr_accessible :board_messages, :broadcast_id, :user_id

  belongs_to :broadcast
  belongs_to :user

end
