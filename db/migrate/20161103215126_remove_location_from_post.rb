class RemoveLocationFromPost < ActiveRecord::Migration[5.0]
  def change
  	remove_column :locations, :post_id
  	add_column :posts, :start_location_id, :integer
  end
end
