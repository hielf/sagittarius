class AddStateIdToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :state_id, :integer
    add_index :photos, :state_id
  end
end
