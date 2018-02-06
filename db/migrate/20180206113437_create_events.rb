class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :image
      t.string :desc
      t.datetime :begin_date
      t.datetime :end_date
      t.string :send_to
      t.integer :user_id
      t.string :notice
      t.string :status

      t.timestamps
    end
  end
end
