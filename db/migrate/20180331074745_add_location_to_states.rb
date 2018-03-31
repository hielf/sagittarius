class AddLocationToStates < ActiveRecord::Migration[5.1]
  def change
    add_column :states, :location, :string
  end
end
