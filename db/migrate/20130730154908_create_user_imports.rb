class CreateUserImports < ActiveRecord::Migration
  def change
    create_table :user_imports do |t|

      t.timestamps
    end
  end
end
