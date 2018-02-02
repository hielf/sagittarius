class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 100
      t.string :password_digest
      t.string :role, default: 'staff'
      t.integer :station_id
      t.string :access_token
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.string :current_sign_in_ip, limit: 50
      t.datetime :last_sign_in_at
      t.string :last_sign_in_ip, limit: 50
      t.integer :failed_attempts
      t.datetime :locked_at

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :station_id
    add_index :users, :access_token
  end
end
