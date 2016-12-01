class AddStringListToRouteRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :route_requests, :start_location_id
    remove_column :route_requests, :end_location_id
    add_column :route_requests, :start_location_name, :string
    add_column :route_requests, :end_location_name, :string
    add_column :route_requests, :list_as_string, :string
  end
end
