class AddAttachmentAvatarToSpeakers < ActiveRecord::Migration
  def self.up
    change_table :speakers do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :speakers, :avatar
  end
end
