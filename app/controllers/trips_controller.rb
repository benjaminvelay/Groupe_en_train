class TripsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @trips = Trip.all
  end

  def show
    @trip = current_user.bookings.where(state: 'paid').find(params[:id])
  end
end
