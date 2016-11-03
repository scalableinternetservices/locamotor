class CreateRouteRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :route_requests do |t|
      t.datetime :start_time
      t.integer :start_location
      t.integer :end_location

      t.timestamps
    end
  end
end
