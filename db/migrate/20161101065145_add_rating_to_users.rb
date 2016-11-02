class AddRatingToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rating, :decimal
  end
end
