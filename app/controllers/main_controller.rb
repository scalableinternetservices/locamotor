class MainController < ApplicationController
  def home
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def help
  end

  def about
  end

  def search
  end

  def results
    @vehicle_types = params[:vehicle_type]
    @search_start = params[:search_start]
    @start_time = params[:start_time]
    @search_end = params[:search_end]
    @end_time = params[:end_time]
    @search_price = params[:search_price]
    @max_price = params[:max_price]
    @search_location = params[:search_location]

    model_query = Post
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
    
    @posts = model_query.paginate(page: params[:page], per_page: 1)

    # search based on id
    if !@search_location.nil?
      # Get all the locations within the correct distance of the start location
      valid_location = Location.near("Irvine, CA", 100, order: 'distance')

      # So this puts lets the next statement work for some reason...
      puts valid_location

      # Get the ids of all the valid locations
      valid_ids = valid_location.ids

      # Get the posts where the start_location_id is valid
      @posts = model_query.where(start_location_id: valid_ids).paginate(page: params[:page], per_page: 10)
    end

    if @posts.size > 0
      num_range = @posts.count
      rand_choice = rand(num_range)
      i = 0
      @posts.each do |ps|
        if i == rand_choice
          response.headers["RandomPostID"] = ps.id
          break
        end
        i = i + 1
      end
    end
  end
end

