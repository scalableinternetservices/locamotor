class MainController < ApplicationController
  def home
    # Get the most recent posts
    @recent_posts = Post.GetRecent.reverse.paginate(page: params[:page], per_page: 10)
  end

  def help
  end

  def about
  end

  def search
  end

  def all
    model_query = Post
    @posts = Array.new
    @posts = model_query.find_each;
  end

  def results
    @vehicle_types = params[:vehicle_type]
    @search_start = params[:search_start]
    @start_time = params[:start_time]
    @search_end = params[:search_end]
    @end_time = params[:end_time]
    @search_price = params[:search_price]
    @max_price = params[:max_price]
    @search_location_across = params[:search_location_across]
    @search_location_within = params[:search_location_within]

    model_query = Post.includes(:creator, :photos, :reservations)
    if !@vehicle_types.nil?
      model_query = model_query.where(:vehicle => @vehicle_types)
    end
    if !@search_start.nil?
      model_query = model_query.where("start_time <= ?",  @start_time)
      model_query = model_query.where("end_time >= ?",  @start_time)
    end
    if !@search_end.nil?
      model_query = model_query.where("start_time <= ?", @end_time)
      model_query = model_query.where("end_time >= ?",  @end_time)
    end
    if !@search_price.nil?
      model_query = model_query.where("price <= ?", @max_price)
    end
    @posts = model_query.paginate(page: params[:page], per_page: 10)

    puts "hi here guys"


    # Search locations within a city
    if !@search_location_within.nil?
      # Get distance
      distance = params[:max_distance].to_i

      # Get addresses
      full_address = FullLocation.GetFullAddress(params[:street], params[:city], params[:state])
      general_location = GeneralLocation.GetGeneralAddress(params[:city], params[:state])

      # Get all the general location
      general_location_records = GeneralLocation.joins(:full_locations).where(address: general_location)#GeneralLocation.where(address: general_location)

      # Check if there are any general locations near the search address
      if general_location_records.size > 0
        # Get all full addresses from the found general location
        valid_locations = Array.new()
        general_location_records.each do |glr|
          glr.get_full_locations_near(full_address, distance, valid_locations)
        end

        # Get the posts where the start_location_id is valid
        model_query = model_query.where(start_location_id: valid_locations)
        @posts = Rails.cache.fetch(model_query.to_s, expires_in: 10.seconds) do
          model_query.paginate(page: params[:page], per_page: 10)
        end

        
      else
        # There is no recorded general location for this full address, so there is no post that can fulfill this query
        @posts = nil
      end
    end

    # Search location across cities
    if !@search_location_across.nil?
      puts "Doing across"
      # Get distance
      distance = params[:max_distance_a].to_i

      # Get addresses
      general_location = GeneralLocation.GetGeneralAddress(params[:city_a], params[:state_a])
      puts "general location is #{general_location}"
      # Get all general locations near this address
      general_location_records = GeneralLocation.near(general_location, distance)#GeneralLocation.where(address: general_location)

      # Check if there are any general locations near the search address
      if general_location_records.size > 0
        puts "looking over general"
        # Get all full addresses from the found general locations
        valid_locations = Array.new()
        general_location_records.each do |glr|
          valid_locations.concat(glr.full_locations.ids)
        end

        # Get the posts where the start_location_id is valid
        model_query = model_query.where(start_location_id: valid_locations)
        @posts = Rails.cache.fetch(model_query.to_s, expires_in: 10.seconds) do
          model_query.paginate(page: params[:page], per_page: 10)
        end
      else
        # There is no recorded general location for this full address, so there is no post that can fulfill this query
        puts "There ain't nothing here"
        @posts = nil
      end
    end


    if @posts.size > 0
      num_range = @posts.count
      puts "Post count" + num_range.to_s
      rand_choice = rand(10)
      i = 0
      @posts.each do |ps|
        if i == rand_choice
          response.headers["RandomPostID"] = ps.id
          break
        end
        i = i + 1
      end
    else
      puts "No Posts"
    end
  end
end

