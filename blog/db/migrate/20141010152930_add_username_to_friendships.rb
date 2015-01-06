class AddUsernameToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :username, :string
  end
end
