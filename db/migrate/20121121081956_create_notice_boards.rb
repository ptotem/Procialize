class CreateNoticeBoards < ActiveRecord::Migration
  def change
    create_table :notice_boards do |t|
      t.text :board_messages
      t.integer :broadcast_id
      t.integer :user_id

      t.timestamps
    end
  end
end
