class AddEncryptedPasswordToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :encrypted_password, :string, default: "", null: false
  end
end
