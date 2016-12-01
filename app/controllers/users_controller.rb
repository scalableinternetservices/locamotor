class UsersController < ApplicationController

  def show
    # current_user.rating = 4.9
    # current_user.save()
    # u = User.find(1)
    # u.rating = 4.3
    # u.save

    # Create rating that current user can use to rate the shown user
    @rating = current_user.ratings_of.build()


    # Find out if current user has already rated the user who we will be showing
#    @can_rate = false
#    if Rating.rating_by_of(current_user.id, params[:id]).present? or current_user.id.to_i == params[:id].to_i
        @can_rate = true
#    end

    @request_set = Post.where("creator_id = #{params[:id]} and post_type = 'RR'").paginate(page: params[:request_page], per_page: 3)
    @offer_set = Post.where("creator_id = #{params[:id]} and post_type = 'FR'").paginate(page: params[:offer_page], per_page: 3)
    @reservation_set = Reservation.where(user_id: params[:id]).paginate(page: params[:reservation_page], per_page: 3)
  end

  def new
  end

  def index
  end

end
