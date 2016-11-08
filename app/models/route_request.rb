class RouteRequest < ApplicationRecord
	has_one :start_location, :foreign_key => "route_id", :class_name => "Location"
end
