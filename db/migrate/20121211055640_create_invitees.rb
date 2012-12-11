class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
