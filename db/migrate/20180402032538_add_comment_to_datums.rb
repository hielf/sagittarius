class AddCommentToDatums < ActiveRecord::Migration[5.1]
  def change
    add_column :data, :comment, :string
  end
end
