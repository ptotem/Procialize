class AddSequenceToEvent < ActiveRecord::Migration
  def self.up
    create_table :event do |t|
      t.integer :sequence
      t.timestamps
    end
  end

  def self.down
    drop_table :user
  end
end
