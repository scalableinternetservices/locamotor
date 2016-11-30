require 'date'

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    
  end

  # Create the post
  def create
    # Get the dictionary of all the arguments from post form
    post_args = params[:post]

    # @post = Post.new
    @post = current_user.created_posts.build()
    @post.email = post_args[:email]
    @post.vehicle = post_args[:vehicle]
    @post.start_time = DateTime.parse(post_args[:start_time])
    @post.end_time = DateTime.parse(post_args[:end_time])
    @post.price = post_args[:dollar_amount]
    @post.description = post_args[:description]
    @post.max_radius = post_args[:max_radius]



    @post.auto_book = params[:auto_book]
    @location = Location.new(address: post_args[:location])

    @location.save

    @post.start_location_id = @location.id 
    # For Rent or Renting Out
    @post.post_type = post_args[:post_type] == "Renting out" ? "FR" : "RR"

    puts @post
    # Save the post in DB if the post is valid
    if @post.valid?
      @post.save
        
      if params[:images]
        params[:images].each do |image|
          @post.photos.create(image: image)
        end
      end
      
      @photos = @post.photos
    end

    response.headers["PostID"] = @post.id
    redirect_to "/main/home"
  end

  def search

  end

  def edit
    @photos = @post.photos
  end

  def show
    post_id = params[:id]
    @post = Post.find(post_id)
    @photos = @post.photos
  end

  def claim
    reservation_args = params[:reservation]
    post_id = params[:id]

    @reservation = current_user.reservations.build()
    @reservation.start_time = DateTime.parse(reservation_args[:start_time])
    @reservation.end_time = DateTime.parse(reservation_args[:end_time])
    @reservation.post_id = post_id
    @reservation.rname = params[:name]
    if params[:confirmed] == "auto_book"
      @reservation.confirmed = true
      @reservation.approved = true
    else
      @reservation.confirmed = false
    end

    if @reservation.valid?
        @reservation.save
    else
      puts @reservation.errors.messages
    end

    redirect_to "/main/home"
  end
end
