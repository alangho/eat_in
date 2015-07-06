class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :about_me, :string
  end
end
