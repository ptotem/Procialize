class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :interest
      t.integer :user_id

      t.timestamps
    end
  end
end
