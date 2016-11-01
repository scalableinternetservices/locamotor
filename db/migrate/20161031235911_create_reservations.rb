class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.time :start_time
      t.time :end_time
      t.references :post
      t.references :user
      t.boolean :confirmed

      t.timestamps
    end
  end
end
