class AddUpperUserNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :upper_user_name, :string
    add_column :users, :upper_client, :string
  end
end
