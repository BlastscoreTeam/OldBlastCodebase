class AddFriendnameToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :friendname, :string
  end
end
