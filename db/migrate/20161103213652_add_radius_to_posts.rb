class AddRadiusToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :max_radius, :decimal
  end
end
