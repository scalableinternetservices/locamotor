class AddClaimedByToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :claimed_by, :string
  end
end
