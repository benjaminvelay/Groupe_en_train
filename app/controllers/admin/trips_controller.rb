class Admin::TripsController < ApplicationController
before_action :authenticate_admin!

  def index
    @pending_trips =  Trip.joins(:bookings).where(bookings: {state: "pending"}).uniq
    @paid_trips =  Trip.joins(:bookings).where(bookings: {state: "paid"}).uniq
    @refused_trips =  Trip.joins(:bookings).where(bookings: {state: "refused"}).uniq

    @pending_full_trips = []
    @pending_trips.each do |trip|
      if trip.bookings.count.to_i == 10
        @pending_full_trips << trip
      end
    end
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
