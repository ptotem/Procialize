class AddBatchieToUser < ActiveRecord::Migration
  def change
    add_column :users, :batchie, :string
  end
end
