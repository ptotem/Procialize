class CreateExhibitors < ActiveRecord::Migration
  def change
    create_table :exhibitors do |t|
      t.has_attached_file :exhi_logo
      t.text :stall_no
      t.text :industry
      t.has_attached_file :brouchers
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
