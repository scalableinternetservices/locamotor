class ChangeUserIdToCreatorId < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :user_id, :creator_id
  end
end
