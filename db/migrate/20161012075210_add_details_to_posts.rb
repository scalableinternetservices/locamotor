class AddDetailsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :description, :text
    add_column :posts, :price, :decimal
    add_column :posts, :end_time, :time
  end
end
