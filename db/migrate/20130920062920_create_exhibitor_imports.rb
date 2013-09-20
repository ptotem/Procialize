class CreateExhibitorImports < ActiveRecord::Migration
  def change
    create_table :exhibitor_imports do |t|
      t.attachment :exhibitor_details
      t.timestamps
    end
  end
end
