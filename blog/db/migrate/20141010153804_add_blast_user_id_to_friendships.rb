class AddBlastUserIdToFriendships < ActiveRecord::Migration
  def change
	add_column :friendships, :blast_user_id, :integer
  end
end
