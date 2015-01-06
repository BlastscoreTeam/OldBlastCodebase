class AddFriendArrayToBlastUser < ActiveRecord::Migration
  def change
    add_column :blast_users, :friendArray, :text
  end
end
