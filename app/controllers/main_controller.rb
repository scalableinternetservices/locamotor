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

  	model_query = Post
  	if !@vehicle_type.nil?
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
  	@posts = model_query.find_each;
  end
end
