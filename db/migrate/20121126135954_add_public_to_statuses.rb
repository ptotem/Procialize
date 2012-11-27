class AddPublicToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :public, :boolean
  end
end
