class ChangeTimeOfPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :start_time
    remove_column :posts, :end_time
    add_column :posts, :start_time, :datetime
    add_column :posts, :end_time, :datetime
  end
end
