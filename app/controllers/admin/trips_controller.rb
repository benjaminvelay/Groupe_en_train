class Admin::TripsController < ApplicationController
before_action :authenticate_admin!

  def index
    @trips =  Trip.joins(:bookings).where(bookings: {state: "pending"})

  end

 def update
  @trip = Trip.find(params[:id])
  @trip.bookings.each do |booking|
    if params[:state] == "refused"
      booking.refused!
    else
      booking.paid!
    end
  end
  redirect_to admin_trips_path
end


  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to home_path and return
    end

  end
end
