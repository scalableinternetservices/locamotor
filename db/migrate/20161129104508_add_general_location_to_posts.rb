class AddGeneralLocationToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :general_location_id, :integer
  end
end
