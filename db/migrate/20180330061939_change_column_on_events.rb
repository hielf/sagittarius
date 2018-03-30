class ChangeColumnOnEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :desc, :text
  end
end
