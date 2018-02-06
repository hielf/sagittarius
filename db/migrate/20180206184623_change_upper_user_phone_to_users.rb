class ChangeUpperUserPhoneToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :upper_user_phone, :string
  end
end
