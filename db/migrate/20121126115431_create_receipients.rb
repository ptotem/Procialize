class CreateReceipients < ActiveRecord::Migration
  def change
    create_table :receipients do |t|
      t.integer :message_id
      t.integer :user_id

      t.timestamps
    end
  end
end
