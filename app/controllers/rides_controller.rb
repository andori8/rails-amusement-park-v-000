class RidesController < ApplicationController
  def new
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @notification = @ride.take_ride
    flash[:notice] = @notification
    redirect_to user_path(@ride.user)
  end
end
