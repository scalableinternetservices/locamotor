class UsersController < ApplicationController

  def show
    # current_user.rating = 4.9
    # current_user.save()
    # u = User.find(1)
    # u.rating = 4.3
    # u.save

    # Create rating that current user can use to rate the shown user
    @rating = current_user.ratings_of.build()

    @can_rate = false

    if Rating.rating_by_of(current_user.id, params[:id]).present? or current_user.id.to_i == params[:id].to_i
        @can_rate = true
    end
    # Find out if current user has already rated the user who we will be showing
  end

  def new
  end

  def index
  end

end
