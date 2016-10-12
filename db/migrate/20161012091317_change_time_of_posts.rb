class ChangeTimeOfPosts < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :start_time, :datetime
    change_column :posts, :end_time, :datetime
  end
end
