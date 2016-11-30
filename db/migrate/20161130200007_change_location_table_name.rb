class ChangeLocationTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :locations, :full_locations
  end
end
