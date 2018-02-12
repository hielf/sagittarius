class RemoveIndexFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_index(:users, :name => 'index_users_on_openid')
  end
end
