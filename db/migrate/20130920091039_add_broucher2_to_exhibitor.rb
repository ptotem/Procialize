class AddBroucher2ToExhibitor < ActiveRecord::Migration
  def self.up
    change_table :exhibitors do |t|
      t.attachment :broucher2
    end
  end
end
