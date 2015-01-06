class AddEncryptedPasswordToBlastUsers < ActiveRecord::Migration
  def change
    add_column :blast_users, :encrypted_password, :string
  end
end
