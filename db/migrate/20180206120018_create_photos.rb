class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :type
      t.string :image
      t.integer :order
      t.string :serial_code
      t.string :status

      t.timestamps
    end
    add_index :photos, :user_id
    add_index :photos, :event_id
  end
end
