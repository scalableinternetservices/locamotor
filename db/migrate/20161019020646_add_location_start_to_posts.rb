class AddLocationStartToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :post_id, :integer
  end
end
