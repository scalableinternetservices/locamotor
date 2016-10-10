class PostsController < ApplicationController
  def new
  end

  def create
    render html: "hello, world!"
  end
end
