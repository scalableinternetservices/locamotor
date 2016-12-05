class AddMoreIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :full_locations, :address
    add_index :general_locations, :address
  end
end
