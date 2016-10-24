class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    post = @photo.room

    @photo.destroy
    @photos = Photo.where(post_id: post.id)

    respond_to :js
  end
end