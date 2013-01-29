class AddNameToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :name, :string
  end
end
