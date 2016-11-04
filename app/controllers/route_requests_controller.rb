class RouteRequestsController < ApplicationController

  def create
  	routes_args = params[:routes]

  	@route_request = current_user.route_requests.build()
  	@route_request.start_time = DateTime.parse(routes_args[:start_time])
  	@start_location = Location.new(address: routes_args[:start_location])
  	@end_location = Location.new(address: routes_args[:end_location])

    @start_location.save
    @end_location.save

    @route_request.start_location_id = @start_location.id
    @route_request.end_location_id = @end_location.id

    if @route_request.valid?
      @route_request.save
    end

    redirect_to "/route_requests/index"
  end

  def new
  	@route_request = RouteRequest.new
  end

  def show
  end

end
