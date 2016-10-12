class UsersController < ApplicationController

  def show
    render html: "#{params[:id]}"
  end

  def new
  end
end
