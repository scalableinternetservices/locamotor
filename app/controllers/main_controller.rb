class MainController < ApplicationController
  def home
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
    post_no_location = model_query.find_each
    @posts = Array.new
    # TODO: Likely will need to refactor this, seems like it's more expensive than it needs to be
    if !@search_location.nil?
      valid_locations = Location.near(params[:location_start], params[:max_distance].to_i)
      puts valid_locations.length
      post_no_location.each do |p|
        valid_locations.each do |l|
          if p.id == l.post_id
            @posts.push(p)
          end
        end
      end
    else
      @posts = model_query.find_each;
    end

  end
end
