class CreateProLogos < ActiveRecord::Migration
  def change
    create_table :pro_logos do |t|
      t.has_attached_file :avatar

      t.timestamps
    end
  end
end
