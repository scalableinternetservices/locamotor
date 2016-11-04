class ReservationsController < ApplicationController

  def approval
  	@reservation = Reservation.find(params[:id])
  	if params[:status] == "approve"
  	  @reservation.approved = true;
  	else
  	  @reservation.approved = false;
  	end
  	@reservation.confirmed = true;

  	if @reservation.valid?
  		@reservation.save
  	end
  	redirect_to "/users/" + current_user.id.to_s
  end

end
