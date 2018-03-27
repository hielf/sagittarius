class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :state_type
      t.string :status
      t.string :note
      t.string :comment

      t.timestamps
    end
    add_index :states, :user_id
    add_index :states, :event_id
  end
end
