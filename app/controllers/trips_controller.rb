class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @trips = ProposedTrip.search
  end

  def show
    @trip = Trip.find(params[:id])
  end
end

