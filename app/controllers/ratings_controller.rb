class RatingsController < ApplicationController

  def show
  end

  def new
    puts "hello there"
    post_args = params[:rating]
    @rating = current_user.ratings_of.build()
    @rating.rated_id = post_args[:rated_id].to_i
    @rating.rated_value = post_args[:given_rating].to_d

    if @rating.valid?
      @rating.save
    end

    redirect_to "/users/#{post_args[:rated_id].to_i}"
  end

  def index
  end

end
