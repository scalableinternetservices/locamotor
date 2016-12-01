class ProcessRouteRequestJob < ActiveJob::Base
  queue_as :default

  def perform(general_start_location, start_location, end_location, start_distance_away, allowed_end_distance_away, requester_user_id, start_time)
    # Do something later
    puts "wtf"
    RouteRequest.build_route(general_start_location, start_location, end_location, start_distance_away, allowed_end_distance_away, requester_user_id, start_time)
    puts "puts place"
  end
end
