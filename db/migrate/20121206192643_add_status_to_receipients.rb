class AddStatusToReceipients < ActiveRecord::Migration
  def change
    add_column :receipients, :status, :boolean
  end
end
