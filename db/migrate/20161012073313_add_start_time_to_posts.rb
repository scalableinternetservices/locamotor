class AddStartTimeToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :start_time, :time
  end
end
