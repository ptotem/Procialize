class AddAttachmentAvatarToDecks < ActiveRecord::Migration
  def self.up
    change_table :decks do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :decks, :avatar
  end
end
