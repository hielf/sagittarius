class AddMediaIdToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :media_id, :string
  end
end
