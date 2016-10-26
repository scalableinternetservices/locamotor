class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
    t.integer  :post_id
    t.datetime :created_at,         null: false
    t.datetime :updated_at,         null: false
    end
  end
end
