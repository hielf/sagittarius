class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.integer :event_id
      t.string :brand
      t.string :name
      t.string :image

      t.timestamps
    end
    add_index :goods, :event_id
  end
end
