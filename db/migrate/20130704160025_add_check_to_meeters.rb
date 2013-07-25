class AddCheckToMeeters < ActiveRecord::Migration
  def change
    add_column :meeters, :check, :boolean
  end
end
