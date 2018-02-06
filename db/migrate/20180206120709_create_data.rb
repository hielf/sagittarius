class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :good_id
      t.integer :in_num
      t.integer :sell_num
      t.integer :budget_num
      t.integer :storage_num
      t.string :status

      t.timestamps
    end
  end
end
