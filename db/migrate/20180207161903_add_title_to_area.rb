class AddTitleToArea < ActiveRecord::Migration[5.1]
  def change
    add_column :areas, :title, :string
    Area.all.each do |item|
      item.title = item.city
      item.save
    end
  end
end
