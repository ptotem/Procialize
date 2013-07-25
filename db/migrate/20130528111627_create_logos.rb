class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.has_attached_file :splash_pic
      t.has_attached_file :oragnizer_pic
      t.has_attached_file :cheif_sponsor

      t.timestamps
    end
  end
end
