class AddAttachmentUserDetailsToUserImports < ActiveRecord::Migration
  def self.up
    change_table :user_imports do |t|
      t.attachment :user_details
    end
  end

  def self.down
    drop_attached_file :user_imports, :user_details
  end
end
