class RouteRequestsController < ApplicationController

  @completedRoutes = Array.new
  
  @allPosts = Array.new
  Post.all.each do |post|
    @allPosts << post
  end
  
  def newLocation(startLocation, endLocation, distance)
    if distance/startLocation.distance_to(endLocation) < 1
      @ratio = distance/startLocation.distance_to(endLocation)
    else
      @ratio = 1
    end
   @finalLocation = Location.new
   @finalLocation.latitude = (endLocation.latitude - startLocation.latitude) * @ratio + startLocation.latitude
   @finalLocation.longitude = (endLocation.longitude - startLocation.longitude) * @ratio + startLocation.longitude
   return @finalLocation
  end
  
  def getNearbyPosts(startLocation)
    @nearbyPosts = Array.new
    @allPosts.all.each do |post|
      if Location.find(post.start_location_id).distance_to(startLocation) < post.max_radius
        @nearbyPosts << post
      end
    end
    return @nearbyPosts
  end
  
  def appendRoute(singleRoute, startLocation, endLocation)
    if startLocation.distance_to(endLocation) < 0.01
      @completedRoutes << singleRoute
      return
    end
    getNearbyPosts(startLocation).each do |post|
      @newSingleRoute = singleRoute.dup
      @newSingleRoute << post
      appendRoute(@newSingleRoute, newLocation(startLocation, endLocation, post.max_radius - Location.find(post.start_location_id).distance_to(startLocation)), endLocation)
    end
  end
  
  def netCost(postArray) 
    @cost = 0
    postArray.each do |post|
      @cost += post.price
    end
    return @cost
  end
  
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
    
    appendRoute(Array.new, @start_Location, @end_Location) 
    @completedRoutes.sort_by{|route| netCost(route)}
  end

  def new
  	@route_request = RouteRequest.new
  end

  def show
  end

end
