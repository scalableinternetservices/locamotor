class AddIndexToForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_index :full_locations, :general_location_id
    add_index :posts, :start_location_id
    add_index :posts, :creator_id
    add_index :posts, :claimer_id
    add_index :ratings, :rated_id
    add_index :ratings, :rater_id
  end
end
