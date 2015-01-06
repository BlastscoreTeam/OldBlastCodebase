class AddBlastUserIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :blast_user_id, :integer
  end
end
