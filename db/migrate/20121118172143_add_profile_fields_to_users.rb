class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :headline, :string
    add_column :users, :industry, :string
    add_column :users, :picture, :string
    add_column :users, :public_profile, :string
    add_column :users, :location, :string
    add_column :users, :token, :string
    add_column :users, :secret, :string
  end
end
