class RenameTypeOfPhotos < ActiveRecord::Migration[5.1]
  def change
    rename_column :photos, :type, :photo_type
    drop_table :user_events
  end
end
