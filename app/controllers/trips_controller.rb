class TripsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
