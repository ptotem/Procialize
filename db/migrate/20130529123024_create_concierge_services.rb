class CreateConciergeServices < ActiveRecord::Migration
  def change
    create_table :concierge_services do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
