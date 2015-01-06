class CreateBlastUsers < ActiveRecord::Migration
  def change
    create_table :blast_users do |t|
      t.string :username

      t.timestamps
    end
  end
end
