class AddGeneralLocationToFullLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :full_locations, :general_location_id, :integer
  end
end
