class CreateExhibitorUserImports < ActiveRecord::Migration
  def change
    create_table :exhibitor_user_imports do |t|
      t.attachment :exhibitor_user_details

      t.timestamps
    end
  end
end
