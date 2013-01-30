class AddColumnsLocationReccoAndIndustryReccoToUser < ActiveRecord::Migration
  def change
    add_column :users, :location_recco, :text
    add_column :users, :industry_recco, :text
  end
end
