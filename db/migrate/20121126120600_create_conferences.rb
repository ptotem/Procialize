class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.text :description
      t.date :starting
      t.date :ending

      t.timestamps
    end
  end
end
