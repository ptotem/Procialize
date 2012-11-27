class AddAutogenToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :autogen, :boolean
  end
end
