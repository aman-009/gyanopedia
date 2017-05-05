class AddProfilePicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profilePic, :string
  end
end
