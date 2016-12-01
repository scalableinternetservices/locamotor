class RouteRequestsController < ApplicationController

  before_action do
    @completedRoutes = Array.new
  end
  
  
  # Get all locations that can be reached by this starting location
  def getNearbyLocations(location_list, current_post, general_location)
    nearby_posts = Array.new
    current_location = location_list[-1]
    general_location.get_full_locations_near_as_location_exclude(current_location, current_post.max_radius, nearby_posts, location_list)

    return nearby_posts
  end
  

  def findRoute(current_route, location_list, end_location, allowed_end_distance_away, general_location)
    if @completedRoutes.size > 3
      return
    end
    # Get the latest location in location list
    current_location = location_list[-1]

    # Get the current post
    current_post = current_route[-1]

    # Get the current distance from the latest location to the end location 
    current_distance_away = current_location.distance_to(end_location) - allowed_end_distance_away
    puts "The distance between #{current_location.address} and #{end_location} is #{current_distance_away}"
    # See if we can get to the end location from this location
    if current_distance_away <= current_post.max_radius
      @completedRoutes << current_route
      return
    end

    # Go through all the nearby locations of the current route
    getNearbyLocations(location_list, current_post, general_location).each do |nearby_location|
      nearby_location.posts.each do |nearby_post|
        new_location_list = location_list.dup
        new_location_list << nearby_location
        new_current_route = current_route.dup
        new_current_route << nearby_post
        findRoute(new_current_route, new_location_list, end_location, allowed_end_distance_away, general_location)
      end
    end
  end

  # def appendRoute(singleRoute, startLocation, endLocation)
  #   if startLocation.distance_to(endLocation) < 0.01
  #     @completedRoutes << singleRoute
  #     return
  #   end
  #   getNearbyPosts(startLocation, singleRoute, general_location).each do |post|
  #     @newSingleRoute = singleRoute.dup
  #     @newSingleRoute << post
  #     appendRoute(@newSingleRoute, newLocation(startLocation, endLocation, post.max_radius - FullLocation.find(post.start_location_id).distance_to(startLocation)), endLocation)
  #   end
  # end
  
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

    general_start_location = GeneralLocation.GetGeneralAddress(routes_args[:start_city], routes_args[:start_state])

    # Get general location
    general_location_array = GeneralLocation.where(address: "#{general_start_location}")

    if general_location_array.size > 0
      puts "This general location exists, it is #{general_start_location  }"
      general_location = general_location_array[0]
    else
      # There is no route
      # TODO: send message to user saying we can not find a route
      puts "Creating this general location"
      general_location = GeneralLocation.new(address: general_address)
      general_location.save
    end

    # Get the starting and ending full locations
    start_location = FullLocation.GetFullAddress(routes_args[:start_street], routes_args[:start_city], routes_args[:start_state])
    end_location = FullLocation.GetFullAddress(routes_args[:end_street], routes_args[:end_city], routes_args[:end_state])

    # Get distances
    start_distance_away = routes_args[:start_max_distance].to_i
    allowed_end_distance_away = routes_args[:end_max_distance].to_i

    # Get all full locations within this general location.
    # We will only look for posts within 1 mile of the user
    valid_starting_locations = Array.new()
    general_location.get_full_locations_near_as_location(start_location, start_distance_away, valid_starting_locations)

    if valid_starting_locations.size < 1
      # There is no route, do something
      puts "There is no valid starting locations here"
    end

    # Go through each valid starting full location
    valid_starting_locations.each do |sl|
      puts "Looking at #{sl.address}"
      # Go through each valid post of this starting location
      sl.posts.each do |current_start_post|
        current_route = Array.new
        location_list = Array.new
        current_route.push(current_start_post)
        location_list.push(sl)
        findRoute(current_route, location_list, end_location, allowed_end_distance_away, general_location)
      end
    end

    @completedRoutes = @completedRoutes.sort_by{|route| netCost(route)}
  end

  def build_route
    ProcessRouteRequestJob.perform_later(start_location, end_location, start_distance_away, allowed_end_distance_away, current_user.id)
    routes_args = params[:routes]

    @route_request = current_user.route_requests.build()
    @route_request.start_time = DateTime.parse(routes_args[:start_time])

    general_start_location = GeneralLocation.GetGeneralAddress(routes_args[:start_city], routes_args[:start_state])

    # Get general location
    general_location_array = GeneralLocation.where(address: "#{general_start_location}")

    if general_location_array.size > 0
      puts "This general location exists, it is #{general_start_location  }"
      general_location = general_location_array[0]
    else
      # There is no route
      # TODO: send message to user saying we can not find a route
      puts "Creating this general location"
      general_location = GeneralLocation.new(address: general_address)
      general_location.save
    end

    # Get the starting and ending full locations
    start_location = FullLocation.GetFullAddress(routes_args[:start_street], routes_args[:start_city], routes_args[:start_state])
    end_location = FullLocation.GetFullAddress(routes_args[:end_street], routes_args[:end_city], routes_args[:end_state])

    # Get distances
    start_distance_away = routes_args[:start_max_distance].to_i
    allowed_end_distance_away = routes_args[:end_max_distance].to_i

    # Get all full locations within this general location.
    # We will only look for posts within 1 mile of the user
    valid_starting_locations = Array.new()
    general_location.get_full_locations_near_as_location(start_location, start_distance_away, valid_starting_locations)

    if valid_starting_locations.size < 1
      # There is no route, do something
      puts "There is no valid starting locations here"
    end

    # Go through each valid starting full location
    valid_starting_locations.each do |sl|
      puts "Looking at #{sl.address}"
      # Go through each valid post of this starting location
      sl.posts.each do |current_start_post|
        current_route = Array.new
        location_list = Array.new
        current_route.push(current_start_post)
        location_list.push(sl)
        findRoute(current_route, location_list, end_location, allowed_end_distance_away, general_location)
        if @completedRoutes.size > 3
          break
        end
      end
      if @completedRoutes.size > 3
        break
      end
    end

    @completedRoutes = @completedRoutes.sort_by{|route| netCost(route)}
  end


  def new
    @route_request = RouteRequest.new
  end

  def show
  end

end
