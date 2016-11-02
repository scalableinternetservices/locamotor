class AddRatedValueToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :rated_value, :decimal
  end
end
