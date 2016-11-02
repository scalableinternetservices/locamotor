class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :rated_id
      t.integer :rater_id

      t.timestamps
    end
  end
end
