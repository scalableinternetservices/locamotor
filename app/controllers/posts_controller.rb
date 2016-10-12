require 'date'

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  # Create the post
  def create
    # Get the dictionary of all the arguments from post form
    post_args = params[:post]

    @post = Post.new
    @post.email = post_args[:email]
    @post.vehicle = post_args[:vehicle]
    @post.start_time = DateTime.parse(post_args[:start_time])
    @post.end_time = DateTime.parse(post_args[:end_time])
    @post.price = post_args[:dollar_amount]
    @post.description = post_args[:description]

    # Save the post in DB if the post is valid
    if @post.valid?
        @post.save
    end

    redirect_to "/main/home"
  end
end
