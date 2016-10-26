class AddClaimerIdToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :claimer_id, :integer
  end
end
